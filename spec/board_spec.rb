# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require 'pry'


describe Board do

	subject(:board) {Board.new}
	let(:player) {Player.new("wes", "X")}

	# describe '#check_win' do

	# 	context 'when the board object contains a winning combo' do

	# 		before do
	# 			winning_board = %w{X X X 4 O 6 7 O O}
	# 			board.instance_variable_set(:@cells, winning_board)
	# 		end

	# 		it 'returns true' do
	# 			expect(board.game_over?(@player1)).to be(true)
	# 		end
	# 	end

	# 	context 'when the board object does not contain a winning combo' do

	# 		before do
	# 			no_win_board = %w{X 2 X 4 O 6 7 8 O}
	# 			board.instance_variable_set(:@cells, no_win_board)
	# 		end
			
	# 		it 'returns false' do
	# 			expect(board.game_over?(@player1)).to be(false)
	# 		end
	# 	end
	# end

	describe 'board_update' do

		context 'when player one updates square 3' do
			it 'replaces the 3 with the player\'s token (X)'do
				input = 3
				board.board_update(input, player)
				expect(board.cells[2]).to eq("X")
			end
		end
	end

	describe 'valid_move?' do

		context 'when a valid move is submitted' do
			it 'returns true' do
				move = board.valid_move?(3)
				expect(move).to be(true)
			end
		end

		context 'when an invalid move is submitted' do
			it 'returns false' do
				move = board.valid_move?(100)
				expect(move).to be(false)
			end
		end
	end
end



