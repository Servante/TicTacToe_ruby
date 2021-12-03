# frozen_string_literal: true

#contains the game logic

require "pry"
require_relative 'display.rb'

class Game
	include Display
	attr_accessor :player1, :player2, :current_player

	
	def initialize
		@player1 = nil
		@player2 = nil
		@turn_count = 0
		@board = Board.new
	end

	def play_game
		puts display_introduction
		# game_setup
		# board.show
		# game_turns
		# game_finish
	end

	def player_creation(number)
		puts display_new_player(number)
		name = gets.chomp
		token = @player1 == nil ? "X" : "O"
		player = Player.new(name, token)
		@current_player = player if @player1 == nil
		return player
	end
end

