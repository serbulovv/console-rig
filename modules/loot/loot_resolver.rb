# frozen_string_literal: true

module Modules
  module Loot
    class LootResolver
      def self.resolve(monster_data)
        new(monster_data).resolve
      end

      def initialize(monster_data)
        @monster_data = monster_data
      end

      def resolve
        drops.each_with_object([]) do |drop, result|
          next unless rand <= drop['chance']

          quantity = rand(drop['min']..drop['max'])
          result << { item_id: drop['item_id'], quantity: quantity }
        end
      end

      private

      def drops
        @monster_data['drops'] || []
      end
    end
  end
end