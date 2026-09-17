# frozen_string_literal: true

module Modules
  module Strategies
    class BasicAttackStrategy < CombatStrategy
      def decide(actor, target)
        Commands::AttackCommand.new(actor, target)
      end
    end
  end
end