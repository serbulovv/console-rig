# frozen_string_literal: true

module Modules
  module States
    class DungeonsMenuState < MenuState
      FIELDS = [
        { name: 'Back', position: 1, id: 1 },
        { name: 'Forest', position: 2, id: 2 }
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
          context.transition_to(MainMenuState.new)
        when 2
          context.transition_to(LocationState.new('forest'))
        else
          puts Helpers::Locales::WRONG_MENU_OPTION_ERROR
        end
      end
    end
  end
end