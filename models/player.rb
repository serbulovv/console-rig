# frozen_string_literal: true

require_relative '../modules/strategies/basic_attack_strategy'

module Models
  class Player
    BASE_HP = 20
    BASE_ATTACK_RATING = 1
    BASE_DEFENSE_RATING = 1
    BASE_LEVEL = 1

    attr_accessor :hp, :level, :strategy, :inventory, :equipped
    attr_reader :name

    def initialize(name: 'Гравець')
      @name = name
      setup_base_values
    end

    def restore_hp!
      @hp = BASE_HP
    end

    def add_item(item_id, quantity)
      @inventory[item_id] += quantity
    end

    def attack_rating
      BASE_ATTACK_RATING + equipment_bonus('attack_bonus')
    end

    def defense_rating
      BASE_DEFENSE_RATING + equipment_bonus('defense_bonus')
    end

    private

    def equipment_bonus(bonus_key)
      @equipped.values.compact.sum do |item_id|
        Modules::Repositories::ItemRepository.find(item_id)[bonus_key].to_i
      end
    end

    def setup_base_values
      @hp = BASE_HP
      @level = BASE_LEVEL
      @strategy = Modules::Strategies::BasicAttackStrategy.new
      @inventory = Hash.new(0)
      @equipped = { 'weapon' => nil, 'armor' => nil }
    end
  end
end