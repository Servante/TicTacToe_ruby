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
end