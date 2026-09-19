# frozen_string_literal: true

module Models
  class Enemy
    attr_accessor :hp, :attack_rating, :defense_rating
    attr_reader :name, :strategy, :drops

    def initialize(name:, hp:, attack_rating:, defense_rating:, strategy:, drops: [])
      @name = name
      @hp = hp
      @attack_rating = attack_rating
      @defense_rating = defense_rating
      @strategy = strategy
      @drops = drops
    end
  end
end