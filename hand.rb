class Hand
	attr_accessor :cards

	def initialize
		@cards = []
	end

	def total
		total = 0
		cards.each do |card|
			val = card.value
			if val == 'Ace'
				total += 11
			elsif val == 'Jack' || val == 'Queen' || val == 'King'
				total += 10
			else 
				total += val.to_i
			end
		end

		#Correct for Aces
		number_of_aces = cards.select { |card| card.value == 'Ace' }.count
		number_of_aces.times { total -= 10 if total > 21 }

		total
	end

	def add_a_card
	end

end