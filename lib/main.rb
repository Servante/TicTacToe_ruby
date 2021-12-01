# frozen_string_literal: true

require_relative "game.rb"
require_relative "display.rb"
require_relative "board.rb"
require_relative "player.rb"


def start_game
	game = Game.new
	game.play_game
end


start_game
