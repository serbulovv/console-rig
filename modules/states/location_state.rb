# frozen_string_literal: true

module Modules
  module States
    class LocationState < MenuState
      def initialize(location_key)
        @location_key = location_key
        @location = Repositories::LocationRepository.find(location_key)
      end

      def render
        clear_menus

        monsters.each_with_index do |monster, index|
          label = monster['boss'] ? Helpers::Locales::BOSS_LABEL % { name: monster['name'] } : monster['name']
          puts "#{index + 1}. #{label}"
        end

        puts "#{monsters.size + 1}. #{Helpers::Locales::BACK_OPTION_LABEL}"
        print "#{Helpers::Locales::CHOOSE_MENU_OPTION}: "
      end

      def handle_input(input)
        back_option = monsters.size + 1

        if input == back_option
          context.transition_to(DungeonsMenuState.new)
          return
        end

        monster_data = monsters[input - 1]

        if monster_data
          enemy = build_enemy(monster_data)
          context.transition_to(FightState.new(context.player, enemy, @location_key))
        else
          puts Helpers::Locales::WRONG_MENU_OPTION_ERROR
        end
      end

      private

      def monsters
        @monsters ||= @location['monster_ids'].map { |id| Repositories::MonsterRepository.find(id) }
      end

      def build_enemy(monster_data)
        ::Models::Enemy.new(
          name: monster_data['name'],
          hp: monster_data['hp'],
          attack_rating: monster_data['attack_rating'],
          defense_rating: monster_data['defense_rating'],
          strategy: Strategies::BasicAttackStrategy.new
        )
      end
    end
  end
end