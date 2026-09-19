# frozen_string_literal: true

module Modules
  module States
    class EquipmentState < MenuState
      def render
        clear_menus

        puts Helpers::Locales::EQUIPMENT_TITLE

        equippable_items.each_with_index do |item_id, index|
          item_name = Modules::Repositories::ItemRepository.find(item_id)['name']
          puts "#{index + 1}. #{item_name}"
        end

        puts "#{equippable_items.size + 1}. #{Helpers::Locales::BACK_OPTION_LABEL}"
        print "#{Helpers::Locales::CHOOSE_MENU_OPTION}: "
      end

      def handle_input(input)
        back_option = equippable_items.size + 1

        if input == back_option
          context.transition_to(MainMenuState.new)
          return
        end

        item_id = equippable_items[input - 1]

        if item_id
          Modules::Equipment::EquipItemService.call(context.player, item_id)
          puts Helpers::Locales::EQUIP_SUCCESS
        else
          puts Helpers::Locales::WRONG_MENU_OPTION_ERROR
        end
      end

      private

      def equippable_items
        @equippable_items ||= context.player.inventory.keys.select do |item_id|
          data = Modules::Repositories::ItemRepository.find(item_id)
          data && data['type'] == 'equipment'
        end
      end
    end
  end
end