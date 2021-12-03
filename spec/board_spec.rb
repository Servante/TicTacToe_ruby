# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require 'pry'


describe Board do

	describe '#check_win' do

		subject(:board_check_win) {Board.new}
		let(:player) {Player.new("wes", "X")}


		context 'when the board object contains a winning combo' do

			before do
				winning_board = %w{X X X 4 O 6 7 O O}
				board_check_win.instance_variable_set(:@cells, winning_board)
			end

			it 'returns true' do
				expect(board_check_win.game_win?(@player1)).to be(true)
			end
		end
	end
end



