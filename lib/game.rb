# frozen_string_literal: true

#contains the game logic

require "pry"
require_relative 'display.rb'

class Game
	include Display
	attr_accessor :player1, :player2, :current_player, :board

	
	def initialize
		@player1 = nil
		@player2 = nil
		@turn_count = 0
		@board = Board.new
	end

	def play_game #combine wiht game turns
		game_setup
		@board.show #delete
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

	def game_turn
		until @turn_count == 9
			update_turn_count
			@board.show
			cell = player_input
			@board.board_update(cell, @current_player)
			break if @board.game_over?(@current_player) == true
			@current_player = switch_current_player
		end

		display_tie

	end	

	private

	def update_turn_count
		@turn_count += 1
	end

	def verify_input(input)#refactor with ternary
		if input.ord.between?(48,58) && @board.cells.join.include?(input.to_i)
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

	def player_input(player)
		display_move_prompt
		input = gets.chomp.to_i
		return input if board.valid_move?(input)
		display_invalid_input
		player_input(player)
	end

	def switch_current_player
		if @current_player == @player1
			@player2
		else
			@player1
		end
	end
end

