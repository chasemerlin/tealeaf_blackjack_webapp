class Dealer < Player
	
	def initialize
		@name = "Dealer"
		@hand = Hand.new
	end

end