# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'


describe Board do

	describe '#check_win' do

		subject(:board_check_win) {Board.new}
		let(:player) {Player.new("wes", "X")}


		context 'when the player has winning moves in moves list' do

			before do
				player.instance_variable_set(:@moves, [1, 2, 3])
			end

			it 'returns a win message' do
				expect
			end
		end
	end
end



