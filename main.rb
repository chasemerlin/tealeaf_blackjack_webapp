require 'rubygems'
require 'sinatra'
require './card'
require './deck'
require './player'
require './dealer'
require './hand'
require './game'


set :sessions, true

get '/' do
	session[:user] = nil
	if session[:user] == nil
		redirect '/form'
	else
		redirect 'game'
	end
end

get '/form' do
	erb :form
end

post '/username' do
	session[:user] = params['username']
	redirect '/game'
end

get '/game' do
	@game = Game.new
	@game.deal_cards
	erb :game
end






