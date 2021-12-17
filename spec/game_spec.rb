# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

require 'pry'

describe Game do



	describe '#play_game' do
		subject(:game) {described_class.new}

		it 'runs game_setup, game_turns and game_finish' do
			expect(game).to receive(:game_setup)
			expect(game).to receive(:game_turns)
			expect(game).to receive(:game_finish)
			game.play_game
		end
	end
	
	describe '#player_creation' do
		subject(:game) {described_class.new}
		
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



	# describe 'verify_input' do

	# 	subject(:game) {described_class.new}
	# 	# let(:board) {instance_double(Board)}

	# 	# before do
	# 	# 	cells = [1,2,3,4,"X",6,7,8,9]
	# 	# 	allow(board).to receive(:cells).and_return(cells)
	# 	# 	game.instance_variable_set(:@board, board)
	# 	# end

	# 	context 'when valid input is entered' do

	# 		it 'returns the input' do
	# 			returned_input = game.verify_input("7")
	# 			expect(returned_input).to be("7")
	# 		end			
	# 	end

	# 	context 'when invalid input is entered' do

	# 		before do				
	# 			allow(game).to receive(:player_move)	
	# 		end

	# 		it 'returns nil' do
	# 			invalid_input = '100'
	# 			returned_result = game.verify_input(invalid_input)
	# 			expect(returned_result).to eq(nil)
	# 		end
	# 	end
	# end

	# describe 'game_turn' do
	# 	subject(:game_turn) {described_class.new}
	# 	let(:game_turn_board) {instance_double(Board)}
	# 	player1 = Player.new("wes", "X")
	# 	player2 = Player.new("bria", "O")


	# 	before do
	# 		game_turn.instance_variable_set(:@player1, player1)
	# 		game_turn.instance_variable_set(:@current_player, player1)
	# 		game_turn.instance_variable_set(:@player2, player2)
	# 		game_turn.instance_variable_set(:@board, game_turn_board)
	# 		allow(game_turn_board).to receive(:show)
	# 		allow(game_turn_board).to receive(:board_update)
	# 		allow(game_turn_board).to receive(:game_over?)
	# 	end


	# 	context 'when display_game_turn is called' do
	# 		it 'if no one wins, it runs until turn_count reaches 9' do
	# 			allow(game_turn).to receive(:player_input).and_return("1","2","3","4","5","6","7","8","9")
	# 			expect(game_turn).to receive(:display_tie)
	# 			game_turn.game_turn
	# 		end

	# 		it 'if a player actually wins, the loop end and #game_finish is called' do
	# 			game_turn_board.instance_variable_set(:@cells, [1,2,3,4,5,6,7,8,9])
	# 			allow(game_turn_board).to receive(:game_over?).and_return(true)
	# 			allow(game_turn).to receive(:player_input).and_return("1","4","2","7","3")

				
	# 			expect(game_turn).to receive(:player_input).exactly(5).times
	# 			game_turn.game_turn
	# 		end
	# 	end
	# end
end
