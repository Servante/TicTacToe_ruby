# frozen_string_literal: true

#contains the game logic

require_relative 'display.rb'

class Game
	include Display
	attr_accessor :player1, :player2, :current_player, :board, :turn_count

	
	def initialize
		@player1 = nil
		@player2 = nil
		@current_player = nil
		@turn_count = 0
		@board = Board.new
	end

	def play_game
		game_setup 
		game_turns 
		game_finish 
	end

	def player_creation(number)
		puts display_new_player(number)
		name = gets.chomp
		token = @player1 == nil ? "X" : "O"
		player = Player.new(name, token)
		@current_player = player if @player1 == nil
		return player
	end

	def player_turn 
		@board.show
		cell = player_input(@current_player) 
		board.board_update(cell, @current_player) 
		@current_player = switch_current_player 
	end	

	private

	def game_turns
		until @turn_count == 9
			@turn_count += 1
			player_turn
			break if @board.game_over?
		end
		switch_current_player
	end

	def game_finish
		display_win
	end

	def update_turn_count
		@turn_count += 1
	end

	def game_setup
		display_introduction
		@player1 = player_creation(1)
		@player2 = player_creation(2)
	end

	def player_input(player)
		display_move_prompt(@current_player)
		input = gets.chomp.to_i
		return input if board.valid_move?(input)
		display_invalid_input
		player_input(player)
	end

	def switch_current_player
		@current_player = @current_player == @player1 ? @player2 : @player1
	end

	def game_finish
		if board.game_over?
			display_win(@current_player)
		else
			display_tie
		end
	end
end

