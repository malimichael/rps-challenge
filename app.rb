require 'sinatra/base'
require './lib/game'

class RPS < Sinatra::Base

  before {@game = Game.instance}

  get '/' do
    erb :index
  end

  post '/name' do
    player = Player.new(params[:name].capitalize)
    @game = Game.create(player)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/battle' do
    @game.player.weapon = params[:weapon]
    @game.npc_chooses_weapon
    redirect '/result'
  end

  get '/result' do
    @game.calculate_score
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
