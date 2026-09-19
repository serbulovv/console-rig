# frozen_string_literal: true

module Modules
  module States
    class InventoryState < MenuState
      def render
        clear_menus

        puts Helpers::Locales::INVENTORY_TITLE

        if context.player.inventory.empty?
          puts Helpers::Locales::INVENTORY_EMPTY
        else
          context.player.inventory.each do |item_id, quantity|
            item_name = Modules::Repositories::ItemRepository.find(item_id)['name']
            puts "#{item_name} x#{quantity}"
          end
        end

        puts "#{Helpers::Locales::CHOOSE_MENU_OPTION}: #{Helpers::Locales::BACK_OPTION_LABEL}"
      end

      def handle_input(_input)
        context.transition_to(MainMenuState.new)
      end
    end
  end
end