# frozen_string_literal: true

class AvailableDateController < Sinatra::Base
  set :views, proc { File.join(File.dirname(__FILE__), '..', 'views') }

  register Sinatra::Flash
  enable :sessions

  get '/available_dates' do
    erb :"available_dates/index"
  end

  get '/available_dates/new' do
    erb :"available_dates/new"
  end

  post '/available_dates' do
    # add the date to the database via the model
    redirect("/available_dates")
  end
end
