# frozen_string_literal: true


class Player
	attr_accessor :name, :token, :moves
	def initialize(name, token)
		@name = name
		@token = token
		@moves = []
	end
end