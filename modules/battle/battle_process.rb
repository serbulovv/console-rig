# frozen_string_literal: true

module Modules
  module Battle
    class BattleProcess
      TICK_INTERVAL = 1 # measured in seconds

      def initialize(player, enemy)
        @player = player
        @enemy = enemy
        @log = []
      end

      def run
        until battle_over?
          resolve_tick
          render_screen
          sleep(TICK_INTERVAL)
        end

        render_screen
        announce_result
      end

      def winner
        @player.hp.positive? ? :player : :enemy
      end

      private

      def resolve_tick
        @log.clear

        player_command = @player.strategy.decide(@player, @enemy)
        @log << player_command.execute
        return if battle_over?

        enemy_command = @enemy.strategy.decide(@enemy, @player)
        @log << enemy_command.execute
      end

      def render_screen
        clear_screen

        puts Helpers::Locales::BATTLE_TITLE % { enemy_name: @enemy.name }
        puts '========================='
        puts Helpers::Locales::PLAYER_HP_LABEL % { hp: [@player.hp, 0].max }
        puts Helpers::Locales::ENEMY_HP_LABEL % { enemy_name: @enemy.name, hp: [@enemy.hp, 0].max }
        puts '-------------------------'
        @log.each { |line| puts line }
      end

      def clear_screen
        puts `clear`
      end

      def battle_over?
        @player.hp <= 0 || @enemy.hp <= 0
      end

      def announce_result
        message = winner == :player ? 'Win!' : 'You lose...'
        puts message
      end
    end
  end
end