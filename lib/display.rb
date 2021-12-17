
# frozen_string_literal: true

require 'pry'

module Display

	def display_introduction
		puts "Let's play some TicTacToe on your terminal. \n\n"
		puts "Player one will be 'X' and player two will be 'O' \n\n"
	end

	def display_new_player(number)
		puts "\n\nPlease enter your name for player ##{number}"
	end

	def display_tie
		puts "\n\nWhat a surprise. We have a tie."
	end

	def display_win(player)
		puts "\n\nCongratulations #{player.name.capitalize}! You won!"
	end

	def display_move_prompt(player)
		puts "#{player.name.capitalize}, please select a square."
	end

	def display_invalid_input
		puts "\\nThat input is invalid."
	end
end
