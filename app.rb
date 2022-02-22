# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './database_setup'
require './lib/space'

# Maker House a Home
class Mahah < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'OK LESSSS GOOOO'
  end

  get '/spaces/new' do
    erb :"spaces/new"
  end

  post '/spaces' do
    Space.add(name: params[:name], description: params[:description], price: params[price:])
    redirect to "/"
  end

  
  run! if app_file == $PROGRAM_NAME
end