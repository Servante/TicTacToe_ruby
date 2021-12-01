# frozen_string_literal: true

#contains the game logic

class Game
	attr_accessor :player1, :player2, :current_player
	def initialize
		@player1 = nil
		@player2 = nil
		@current_player = nil
		@turn_count = 0
		@board = board
	end

	def self.play_game
		game_setup
		board.show
		game_turns
		game_finish
	end

	




end

