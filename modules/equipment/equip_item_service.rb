# frozen_string_literal: true

module Modules
  module Equipment
    class EquipItemService
      def self.call(player, item_id)
        new(player, item_id).call
      end

      def initialize(player, item_id)
        @player = player
        @item_id = item_id
        @item_data = Repositories::ItemRepository.find(item_id)
      end

      def call
        return false unless equippable?
        return false if @player.inventory[@item_id] <= 0

        @player.equipped[@item_data['slot']] = @item_id
        true
      end

      private

      def equippable?
        @item_data && @item_data['type'] == 'equipment'
      end
    end
  end
end