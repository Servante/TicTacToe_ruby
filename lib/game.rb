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
		game_setup
		@board.show
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

	def game_turns
		until @turn_count == 9
			@turn_count += 1
			@board.show
			player_move
			break if @board.game_over?(@current_player) == true
			@current_player = switch_current_player
		end

		display_tie

	end

	

	private

	def verify_input(input)#refactor with ternary
		if input.ord.between?(48,58) && @board.cells.join.include?(input)
			return input
		else
			return nil
		end
	end

	def game_setup
		display_introduction
		@player1 = player_creation(1)
		@player2 = player_creation(2)
	end

	def player_move		
		input = verify_input(player_input)
		if input == nil
			display_invalid_input
			player_move
		else
			@board.update(input, @current_player)
		end
	end

	def player_input
		display_move_prompt
		gets.chomp
	end


	def switch_current_player
		if @current_player == @player1
			@player2
		else
			@player1
		end
	end
end

