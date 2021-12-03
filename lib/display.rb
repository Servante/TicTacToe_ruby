# frozen_string_literal: true

module Display

	def display_introduction
		puts "Let's play some TicTacToe on your terminal. \n\n"
		puts "Player one will be 'X' and player two will be 'O' \n\n"
	end

	def display_new_player(number)
		puts "Please enter your name for player ##{number}"
	end

	def display_tie
		puts "What a surprise. We have a tie."
	end

	def display_win(player)
		puts "Congratulations #{player.name}! You won!"
	end

end
