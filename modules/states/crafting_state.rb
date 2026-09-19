# frozen_string_literal: true

module Modules
  module States
    class CraftingState < MenuState
      def render
        clear_menus

        puts Helpers::Locales::CRAFTING_TITLE

        recipes.each_with_index do |(id, _recipe), index|
          item_name = Modules::Repositories::ItemRepository.find(id)['name']
          puts "#{index + 1}. #{item_name}"
        end

        puts "#{recipes.size + 1}. #{Helpers::Locales::BACK_OPTION_LABEL}"
        print "#{Helpers::Locales::CHOOSE_MENU_OPTION}: "
      end

      def handle_input(input)
        back_option = recipes.size + 1

        if input == back_option
          context.transition_to(MainMenuState.new)
          return
        end

        recipe_entry = recipes.to_a[input - 1]

        if recipe_entry
          craft(recipe_entry.first)
        else
          puts Helpers::Locales::WRONG_MENU_OPTION_ERROR
        end
      end

      private

      def recipes
        @recipes ||= Modules::Repositories::RecipeRepository.all
      end

      def craft(recipe_id)
        form = Modules::Crafting::CraftItemForm.new(context.player, recipe_id)

        if form.save
          puts Helpers::Locales::CRAFT_SUCCESS
        else
          form.errors.each { |error| puts error }
        end
      end
    end
  end
end