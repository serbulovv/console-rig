# frozen_string_literal: true

module Modules
  class MenuContext
    attr_reader :state, :player

    def initialize(state)
      @player = Models::Player.new
      transition_to(state)
    end

    def transition_to(state)
      @state = state
      @state.context = self if @state
    end
    
    def run
      while @state
        @state.render
        input = gets.chomp.to_i
        @state.handle_input(input)
      end
    end

    def start_fight_process
      puts 'Бій почався! (заглушка)'
    end
  end
end