# frozen_string_literal: true

module Modules
  module Commands
    class Command
      def execute
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end