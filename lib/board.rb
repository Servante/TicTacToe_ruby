# frozen_string_literal: true

class Board
	attr_accessor :cells

	def initialize
		@cells = [1,2,3,4,5,6,7,8,9]
	end

	WINNING_COMBOS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [1,5,9], [2,5,8], [3,6,9], [3,5,7]].freeze

	def show

		puts <<-HEREDOC

		#{cells[0]} | #{cells[1]} | #{cells[2]}
		--+---+--
		#{cells[3]} | #{cells[4]} | #{cells[5]}
		--+---+--
		#{cells[6]} | #{cells[7]} | #{cells[8]}


		HEREDOC

	end

	def check_win(player)
		WINNING_COMBOS.each do |combo|
			count = 0
			combo.each do |cell|
				count += 1 if player_moves.include(cell)
				if count == 3
					display_win_message(player)
				end
			end
		end
	end
end