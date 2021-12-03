# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require 'pry'


describe Board do

	describe '#check_win' do

		subject(:board) {Board.new}
		# let(:player) {Player.new("wes", "X")}


		context 'when the board object contains a winning combo' do

			before do
				winning_board = %w{X X X 4 O 6 7 O O}
				board.instance_variable_set(:@cells, winning_board)
			end

			it 'returns true' do
				expect(board.game_win?(@player1)).to be(true)
			end
		end

		context 'when the board object does not contain a winning combo' do

			before do
				no_win_board = %w{X 2 X 4 O 6 7 8 O}
				board.instance_variable_set(:@cells, no_win_board)
			end
			
			it 'it returns false' do
				expect(board.game_win?(@player1)).to be(false)
			end
		end
	end
end



