# frozen_string_literal: true

module Modules
  module States
    class MainMenuState < MenuState
      FIELDS = [
        { name: 'Start', position: 1 },
        { name: 'Inventory', position: 2 },
        { name: 'Exit', position: 3 }
      ].freeze

      def render
        clear_menus

        FIELDS.each do |field|
          puts "#{field[:position]}. #{field[:name]}"
        end

        print "#{Helpers::Locales::CHOOSE_MENU_OPTION}: "
      end

      def handle_input(input)
        case input
        when 1
          context.transition_to(DungeonsMenuState.new)
        when 2
          context.transition_to(InventoryState.new)
        when 3
          context.transition_to(nil)
        else
          puts Helpers::Locales::WRONG_MENU_OPTION_ERROR
        end
      end
    end
  end
end