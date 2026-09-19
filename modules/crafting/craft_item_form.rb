# frozen_string_literal: true

module Modules
  module Crafting
    class CraftItemForm
      attr_reader :errors

      def initialize(player, recipe_id)
        @player = player
        @recipe_id = recipe_id
        @recipe = Repositories::RecipeRepository.find(recipe_id)
        @errors = []
      end

      def save
        return false unless valid?

        persist!
        true
      end

      def valid?
        if @recipe.nil?
          @errors << Helpers::Locales::CRAFT_UNKNOWN_RECIPE
          return false
        end

        missing = missing_materials

        if missing.any?
          @errors << format_missing_error(missing)
          return false
        end

        true
      end

      private

      def missing_materials
        @recipe['materials'].select do |material|
          @player.inventory[material['item_id']] < material['quantity']
        end
      end

      def format_missing_error(missing)
        names = missing.map { |m| Repositories::ItemRepository.find(m['item_id'])['name'] }
        Helpers::Locales::CRAFT_MISSING_MATERIALS % { items: names.join(', ') }
      end

      def persist!
        @recipe['materials'].each do |material|
          @player.inventory[material['item_id']] -= material['quantity']
        end

        @player.add_item(@recipe['result_item_id'], 1)
      end
    end
  end
end