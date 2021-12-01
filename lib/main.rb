# frozen_string_literal: true

require_relative "game.rb"
require_relative "display.rb"
require_relative "board.rb"
require_relative "player.rb"


def play_game
	game = Game.new
	game.play_game
end


play_game
