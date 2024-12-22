# frozen_string_literal: true

require_relative '../../g_1817/step/buy_sell_par_shares'

module Engine
  module Game
    module G18FR
      module Step
        class BuySellParShares < G1817::Step::BuySellParShares
          MIN_BID = 90

          def corporate_actions(entity)
            return [] if @winning_bid

            return [] if @corporate_action && @corporate_action.entity != entity

            actions = []
            if @round.current_actions.none?
              actions << 'take_loan' if @game.can_take_loan?(entity) && !@corporate_action.is_a?(Action::BuyShares)
            end
            actions
          end
        end
      end
    end
  end
end
