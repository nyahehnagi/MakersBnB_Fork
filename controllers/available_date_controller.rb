# frozen_string_literal: true

class AvailableDateController < Sinatra::Base
  set :views, proc { File.join(File.dirname(__FILE__), '..', 'views') }

  register Sinatra::Flash
  enable :sessions

  get '/available_dates' do

  #  @available_dates = AvailableDate.find(space_id: session[:space_id])
  @available_dates = AvailableDate.all
    erb :"available_dates/index"
  end

  get '/available_dates/new' do
    @bnb_dates = BnbDate.all
    session[:space_id] = params['space_id']
    erb :"available_dates/new"

  end

  post '/available_dates' do
    p "Here"
    AvailableDate.create(
      space_id: session[:space_id], 
      date_id: params['date_select']
    )
    redirect("/available_dates")
  end
end
