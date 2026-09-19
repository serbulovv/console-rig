# frozen_string_literal: true

module Modules
  module States
    class FightState < MenuState
      def initialize(player, enemy, location_key)
        @player = player
        @enemy = enemy
        @location_key = location_key
      end

      def render
        @player.restore_hp!

        battle_process = Battle::BattleProcess.new(@player, @enemy)
        battle_process.run

        @result = battle_process.winner
      end

      def handle_input(_input)
        context.transition_to(LocationState.new(@location_key))
      end
    end
  end
end