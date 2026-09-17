# frozen_string_literal: true

module Modules
  module Strategies
    class CombatStrategy
      def decide(actor, target)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end