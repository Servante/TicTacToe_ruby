# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

require 'pry'

describe Game do
	
	describe '#player_creation' do
		subject(:game) {described_class.new}

		# context 'when a request for a new player is called' do
		# 	it 'it uses a module method' do
		# 		message = "Please enter your name for player #1"
		# 		expect(game).to receive(:puts).with(message)
		# 		game.player_creation(1)
		# 	end
		# end

		before do
				name = "fred"
				allow(game).to receive(:puts)
				allow(game).to receive(:gets).and_return(name)
			end

		context 'when a request for the first player is invoked' do

			it 'assigns the token "X" to first player' do
				first_player = game.player_creation(1)
				expect(first_player.token).to eq("X")
			end

			it 'assigns the first player as current_player' do	
				game.player_creation(1)			
				expect(game.current_player).not_to be(nil)
			end
		end

		context 'when a request for the second player is invoked' do

			let(:first_player) {instance_double(Player)}

			before do 
				game.instance_variable_set(:@player1, first_player)
				game.instance_variable_set(:@current_player, first_player)
			end

			it 'assigns the token "O" to second player' do
				second_player = game.player_creation(2)
				expect(second_player.token).to eq("O")
			end			

			it 'does not assign second player as current_player' do
				second_player = game.player_creation(2)
				expect(game.current_player).not_to be(second_player)
			end
		end

		context 'when the script is complete' do

			it 'returns the player object' do
				returned_object = game.player_creation(1)
				expect(returned_object).to be_an_instance_of(Player)
			end
		end
	end

	describe 'verify_input' do

		subject(:game) {described_class.new}
		# let(:board) {instance_double(Board)}

		# before do
		# 	cells = [1,2,3,4,"X",6,7,8,9]
		# 	allow(board).to receive(:cells).and_return(cells)
		# 	game.instance_variable_set(:@board, board)
		# end

		context 'when valid input is entered' do
			





			# it 'returns the input' do
			# 	returned_input = game.verify_input("7")
			# 	expect(returned_input).to be("7")
			# end			
		end

		context 'when invalid input is entered' do

			before do				
				allow(game).to receive(:player_move)	
			end

			it 'returns nil' do
				invalid_input = '100'
				returned_result = game.verify_input(invalid_input)
				expect(returned_result).to eq(nil)
			end
		end
	end
	# describe 'game_turns' do
	# 	subject(:game_turn) {described_class.new}
	# 	let(:player1) {Player.new('Wes', 'X')}

	# 	# before do 
	# 	# 	game_turn.instance_variable_set(:current_player, player1)
	# 	# end

	# 	# context 'when game_turns is called' do
	# 	# 	it 'updates board' do
	# 	# 		# allow(game_turn).to receive(:update_turn_count)
	# 	# 		allow(game_turn).to receive(:puts)
	# 	# 		allow(game_turn).to receive(:player_input).and_return("3")
	# 	# 		allow(game_turn).to receive(:verify_input)
	# 	# 		allow(game_turn.board).to receive(:board_update)
	# 	# 		updated_board = [1,2,"X",4,5,6,7,8,9]
	# 	# 		game_turn.game_turns
	# 	# 		expect(game_turn.board.cells).to eq(updated_board)
	# 	# 	end
	# 	# end
	# end
end
