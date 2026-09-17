# frozen_string_literal: true

require 'json'

module Modules
  module Repositories
    class LocationRepository
      DATA_PATH = File.join('data', 'locations.json')

      class << self
        def find(key)
          all[key.to_s]
        end

        def all
          @all ||= JSON.parse(File.read(DATA_PATH))
        end
      end
    end
  end
end