# frozen_string_literal: true

module Modules
  module Commands
    class AttackCommand < Command
      VARIANCE = 0.2 # +-20% from base attack rating to make damage more random rather than strickt 

      def initialize(actor, target)
        @actor = actor
        @target = target
      end

      def execute
        raw_damage = randomized_damage
        mitigated_damage = [raw_damage - @target.defense_rating, 0].max
        @target.hp -= mitigated_damage

        Helpers::Locales::ATTACK_RESULT % { damage: mitigated_damage, hp: [@target.hp, 0].max }
      end

      private

      def randomized_damage
        base = @actor.attack_rating
        multiplier = 1 + rand(-VARIANCE..VARIANCE)
        (base * multiplier).round
      end
    end
  end
end