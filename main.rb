require 'rubygems'
require 'sinatra'
require 'pry'
require './card'
require './deck'
require './player'
require './dealer'
require './hand'
require './game'


set :sessions, true

get '/' do
	if session[:user].nil?
		redirect '/form'
	else
		redirect 'game'
	end
end

get '/reset' do
	session[:user] = nil
	redirect '/'
end

get '/form' do
	erb :form
end

post '/username' do
	if params[:username].nil? || params[:username].empty?
		@error = "Name can't be blank"
		halt erb :form # Use halt to early return
	end
	session[:user] = params[:username]
	redirect '/game'
end

get '/game' do
	session[:dealer_turn] = false
	session[:game] = Game.new
	session[:game].deal_cards
	erb :game
end

get '/hit' do
	session[:game].player.hand.cards << session[:game].deck.deal_a_card
	if session[:game].player.is_busted?
		@error = "You busted! You lose"
	end
	erb :game
end

get '/stay' do
	session[:dealer_turn] = true
	while session[:game].dealer.hand.total < 17
		session[:game].dealer.hand.cards << session[:game].deck.deal_a_card
		if session[:game].dealer.is_busted?
			@success = "Dealer busted! You win!"
			halt erb :game
		end
	end
	player_total = session[:game].player.hand.total
	dealer_total = session[:game].dealer.hand.total
	if player_total > dealer_total
		@success = "You Win!"
	elsif dealer_total > player_total
		@error = "You Lose!"
	else 
		@alert = "You Tie!"
	end
	erb :game
end






