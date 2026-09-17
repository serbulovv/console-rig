# frozen_string_literal: true

require 'json'

module Modules
  module Repositories
    class MonsterRepository
      DATA_PATH = File.join('data', 'monsters.json')

      class << self
        def find(id)
          all[id.to_s]
        end

        def all
          @all ||= JSON.parse(File.read(DATA_PATH))
        end

        def all_ids
          all.keys
        end
      end
    end
  end
end