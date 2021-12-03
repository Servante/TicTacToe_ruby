# frozen_string_literal: true

require_relative "game.rb"
require_relative "display.rb"
require_relative "board.rb"
require_relative "player.rb"
require 'pry'


def reload 
	load 'lib/main.rb'
end


def start_game
	game = Game.new
	game.play_game
end


start_game

# game = Game.new


# game.player_creation(1)
# binding.pry

# puts game.player1
