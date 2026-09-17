# frozen_string_literal: true

require_relative '../modules/strategies/basic_attack_strategy'

module Models
  class Player
    BASE_HP = 20
    BASE_ATTACK_RATING = 2
    BASE_DEFENSE_RATING = 1
    BASE_LEVEL = 1
    BASE_NAME = 'Player'

    attr_accessor :hp, :attack_rating, :defense_rating, :level, :strategy
    attr_reader :name

    def initialize(name: BASE_NAME)
      @name = name
      setup_base_values
    end

    private

    def setup_base_values
      @hp = BASE_HP
      @attack_rating = BASE_ATTACK_RATING
      @defense_rating = BASE_DEFENSE_RATING
      @level = BASE_LEVEL
      @strategy = Modules::Strategies::BasicAttackStrategy.new
    end
  end
end