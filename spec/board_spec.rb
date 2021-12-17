# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'


describe Board do

	subject(:board) {Board.new}
	let(:player) {Player.new("wes", "X")}

	describe '#game_over?' do

		context 'when the board is new' do
			it 'is not game over' do
				expect(board).not_to be_game_over
			end
		end

		context 'when the board is partially played' do
			before do 
				board.instance_variable_set(:@cells, ["X", "O", 3, "X", 5, 6, "O", 8, 9])
			end

			it 'is not game over' do
				expect(board).not_to be_game_over
			end
		end

		context 'when there\'s a horizontal three-in-a-row' do
			before do
				board.instance_variable_set(:@cells, ["X", "X", "X", "O", 5, "O", 7, 8, 9])
			end

			it 'is game over' do
				expect(board).to be_game_over
			end
		end

		context 'when there\'s a vertical three-in-a-row' do
			before do 
				board.instance_variable_set(:@cells, ["X", "O", "O", "X", 5, 6, "X", 8, 9])
			end
			
			it 'is game over' do
				expect(board).to be_game_over
			end
		end

		context 'when there\'s a diagonal three-in-a-row' do
			before do 
				board.instance_variable_set(:@cells, ["X", "O", "O", 4, "X", "O", 7, 8, "X"])
			end
			it 'is game over' do
				expect(board).to be_game_over
			end
		end
	end

	describe '#board_update' do

		context 'when player one updates square 3' do
			it 'replaces the 3 with the player\'s token (X)'do
				input = 3
				board.board_update(input, player)
				expect(board.cells[2]).to eq("X")
			end
		end
	end

	describe '#valid_move?' do

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

		context 'when an occupied square is selected' do
			before do 
				board.instance_variable_set(:@cells, ["X", 2, 3, 4, 5, 6, 7, 8, 9])
			end
			it 'returns false' do
				input = 1
				expect(board.valid_move?(input)).to be(false)
			end
		end
	end
end



