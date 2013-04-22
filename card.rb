class Card
	attr_accessor :suit, :value

	def initialize(suit, value)
		@suit = suit
		@value = value
	end

	def to_s
	    "The #{value} of #{suit}"
	end
end