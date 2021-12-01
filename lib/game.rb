# frozen_string_literal: true

#contains the game logic

class Game
	attr_accessor :player1, :player2, :current_player
	def initialize
		@player1 = nil
		@player2 = nil
		@current_player = nil
		@turn_count = 0
	end

end

