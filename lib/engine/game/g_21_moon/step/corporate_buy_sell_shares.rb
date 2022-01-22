# frozen_string_literal: true

require_relative '../../../step/buy_sell_par_shares'

module Engine
  module Game
    module G21Moon
      module Step
        class CorporateBuySellShares < Engine::Step::BuySellParShares
          def redeemable_shares(_corp)
            []
          end

          def can_sell_any?(entity)
            can_issue?(entity) || super
          end

          def can_issue?(entity)
            !bought? && entity.num_ipo_shares.positive? && max_issuable(entity).positive?
          end

          def issuable_shares(corp)
            shares = @game.bundles_for_corporation(corp.ipo_owner, corp) # only IPO shares
            shares.reject { |bundle| bundle.num_shares > max_issuable(corp) }
          end

          def max_issuable(corp)
            num_p_shares = @game.players.sum { |p| p.num_shares_of(corp) }
            num_c_shares = @game.corporations.sum { |p| p.num_shares_of(corp) }
            num_m_shares = @game.share_pool.num_shares_of(corp)

            [num_p_shares + num_c_shares - num_m_shares, @game.class::MARKET_SHARE_LIMIT - num_m_shares].min
          end

          def can_buy?(entity, bundle)
            return unless bundle
            # can't buy from own IPO
            return if entity == bundle.corporation && bundle.owner == bundle.corporation.ipo_owner
            # can't buy from other corporations
            return if bundle.owner.corporation?

            super
          end

          # FIXME: move to common location
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

          def process_buy_shares(action)
            @round.bought_from_ipo = true if action.bundle.owner.corporation?
            buy_shares(action.entity, action.bundle, swap: action.swap, allow_president_change: false)
            track_action(action, action.bundle.corporation)
          end

          def process_sell_shares(action)
            if action.entity == action.bundle.corporation && action.bundle.owner == action.bundle.corporation.ipo_owner
              return issue_shares(action)
            end

            super
          end

          def issue_shares(action)
            corp = action.entity
            bundle = action.bundle
            floated = corp.floated?
            price = corp.share_price.price

            @log << "#{corp.name} issues #{share_str(bundle)} of #{corp.name} to the market"\
                    " and receives #{@game.format_currency(bundle.price)}"
            @game.share_pool.transfer_shares(bundle,
                                             @game.share_pool,
                                             spender: @game.bank,
                                             receiver: corp)
            @game.stock_market.move_down(corp) if floated
            @game.log_share_price(corp, price)
            @game.float_corporation(corp) if corp.floatable && floated != corp.floated?

            track_action(action, corp)
          end

          def share_str(bundle)
            num_shares = bundle.num_shares
            return "a #{bundle.percent}% IPO share" if num_shares == 1

            "#{num_shares} IPO shares"
          end

          def can_ipo_any?(_entity)
            false
          end
        end
      end
    end
  end
end
