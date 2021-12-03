# frozen_string_literal: true


require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'



describe Game do
	
	describe '#player_creation' do
		subject(:player_prompt) {Game.new}

		# context 'when a request for a new player is called' do
		# 	it 'it uses a module method' do
		# 		message = "Please enter your name for player #1"
		# 		expect(player_prompt).to receive(:puts).with(message)
		# 		player_prompt.player_creation(1)
		# 	end
		# end

		context 'when a request for the first player is invoked' do

			before do
				name = "fred"
				allow(player_prompt).to receive(:puts)
				allow(player_prompt).to receive(:gets).and_return(name)
			end

			it 'assigns the token "X" to first player' do
				first_player = player_prompt.player_creation(1)
				expect(first_player.token).to eq("X")
			end

			it 'assigns the first player as current_player' do	
				player_prompt.player_creation(1)			
				expect(player_prompt.current_player).not_to be(nil)
			end
		end

		context 'when a request for the second player is invoked' do

			let(:first_player) {instance_double(Player)}

			it 'assigns the token "O" to second player' do
				new_game = Game.new(first_player)
				second_player = player_prompt.player_creation(2)
				expect(second_player.token).to eq("O")
			end			

			xit 'does not assign second player as current_player' do
			end

			xit 'returns the player object' do				
			end
		end
	end
end
