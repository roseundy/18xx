# frozen_string_literal: true

require_relative '../../../step/buy_sell_par_shares'

module Engine
  module Game
    module G21Moon
      module Step
        class BuySellParShares < Engine::Step::BuySellParShares
          def actions(entity)
            return [] unless @round.pending_trades.empty?

            super
          end

          def can_ipo_any?(entity)
            !bought? && @game.corporations.any? do |c|
              @game.can_par?(c, entity) && can_buy?(entity, c.ipo_shares.first&.to_bundle)
            end
          end

          def can_buy_any?(entity)
            (can_buy_any_from_market?(entity) ||
             can_buy_any_from_ipo?(entity) ||
             can_trade_any?(entity))
          end

          def can_buy_any_from_ipo?(entity)
            @game.corporations.each do |corporation|
              next unless corporation.ipoed
              return true if can_buy_shares?(entity, corporation.ipo_shares)
            end

            false
          end

          def can_trade_any?(entity)
            @game.corporations.each do |corporation|
              next unless corporation.ipoed
              return true if can_buy_shares?(entity, corporation.corporate_shares) && can_trade_for_share?(entity, corporation)
            end

            false
          end

          def can_trade_for_share?(entity, owner)
            @game.corporations.reject { |c| c == owner }.any? do |corporation|
              bundles = @game.bundles_for_corporation(entity, corporation)
              bundles.any? { |bundle| can_sell?(entity, bundle) }
            end
          end

          def can_buy?(entity, bundle)
            return if bundle&.owner&.corporation? && bundle&.owner&.corporation&.owner != entity
            return if bundle&.owner&.corporation? && !can_trade_for_share?(entity, bundle.corporation)

            super
          end

          def process_buy_shares(action)
            return start_trade(action) if action&.bundle&.owner&.corporation?

            super
          end

          def start_trade(action)
            @log << "#{action.entity.name} starts a trade for a share of #{action.bundle.corporation.name}"

            track_action(action, action.bundle.corporation)

            @round.pending_trades << {
              entity: action.entity,
              bundle: action.bundle,
            }

            @round.clear_cache!
          end

          def buy_shares(entity, shares, exchange: nil, swap: nil, allow_president_change: true)
            corp = shares.corporation
            if shares.owner == corp.ipo_owner
              # IPO shares pay corporation
              @game.share_pool.buy_shares(entity,
                                          shares,
                                          exchange: exchange,
                                          swap: swap,
                                          allow_president_change: allow_president_change)
              price = corp.share_price.price * shares.num_shares
              @game.bank.spend(price, corp)
            else
              super
            end
          end

          # don't look at corporate holdings, only players
          def can_dump?(entity, bundle)
            return true unless bundle.presidents_share

            sh = bundle.corporation.player_share_holders
            (sh.reject { |k, _| k == entity }.values.max || 0) >= bundle.presidents_share.percent
          end

          def corporate_buy_text(_share)
            'Trade for'
          end
        end
      end
    end
  end
end
