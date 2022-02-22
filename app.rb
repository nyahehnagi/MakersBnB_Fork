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
    space = Space.new(
      name: params[:name],
      description: params[:description], 
      price: params[:price],
      owner_customer_id: params[:owner_customer_id])
    space.save

    redirect to "/"
  end

  
  run! if app_file == $PROGRAM_NAME
end