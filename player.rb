class Player 
	attr_accessor :name, :hand

	def initialize
		@name = ''
		@hand = Hand.new
	end

	def is_busted?
		hand.total > Game::BLACKJACK_AMOUNT
	end
end