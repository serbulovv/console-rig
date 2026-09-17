# frozen_string_literal: true

module Modules
  module States
    class MenuState
      attr_accessor :context

      # @abstract
      def render
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end

      # @abstract
      def handle_input(input)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end

      private

      def clear_menus
        puts `clear`
      end
    end
  end
end