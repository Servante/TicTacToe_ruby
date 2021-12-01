# frozen_string_literal: true

#contains the game logic

include "pry"
require_relative "display.rb"

class Game
	attr_accessor :player1, :player2, :current_player

	def initialize
		@player1 = nil
		@player2 = nil
		@current_player = nil
		@turn_count = 0
		@board = board
	end

	def play_game
		game_setup
		board.show
		game_turns
		game_finish
	end

	def player_creation(number)
		display_new_player
		name = gets.chomp
		token = @player1 == nil ? "X" : "O"
		player = Player.new(name, token)
		@current_player = player if @player1 = nil
		return player
	end










end

