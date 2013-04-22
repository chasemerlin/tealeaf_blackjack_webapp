class Deck
	attr_accessor :cards

	def initialize
		@cards = []
		['Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King'].each do |face|
			['Hearts','Spades','Diamonds','Clubs'].each do |suit|
				cards << Card.new(suit,face)
			end
		end
		@cards.shuffle!
	end

	def deal_a_card
		cards.pop
	end
end