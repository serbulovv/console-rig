# frozen_string_literal: true

require 'json'

module Modules
  module Repositories
    class RecipeRepository
      DATA_PATH = File.join('data', 'recipes.json')

      class << self
        def find(id)
          all[id.to_s]
        end

        def all
          @all ||= JSON.parse(File.read(DATA_PATH))
        end
      end
    end
  end
end