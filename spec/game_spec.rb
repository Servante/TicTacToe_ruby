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

	describe 'player_turn' do
		subject(:game) {described_class.new}

		before do 
			current_player = (Player.new("wes", "X"))
			game.instance_variable_set(:@board, instance_double(Board))
			game.instance_variable_set(:@current_player, current_player)
			allow(game.board).to receive(:show)
			allow(game).to receive(:puts)
			allow(game.board).to receive(:valid_move?)
		end

		it 'sends an update message to the board' do
			cell = "7"
			player_input = "3"
			# binding.pry
			allow(game).to receive(:player_input).and_return(player_input)
			expect(game.board).to receive(:board_update).with(player_input, game.current_player)
			game.player_turn
		end
	end	
end
