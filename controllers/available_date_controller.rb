# frozen_string_literal: true

class AvailableDateController < Sinatra::Base
  set :views, proc { File.join(File.dirname(__FILE__), '..', 'views') }

  register Sinatra::Flash
  enable :sessions

  get '/available_dates/new' do
    @space_id  = params['space_id']
    @bnb_dates = BnbDate.all
    @available_dates = AvailableDate.find_by_id(space_id: @space_id)
    session[:space_id] = @space_id
    erb :"available_dates/new"
  end

  post '/available_dates' do
    AvailableDate.create(
      space_id: session[:space_id], 
      date_id: params['date_select']
    )
    redirect("/available_dates/new?space_id=#{session[:space_id]}")
  end
end

# <% @available_dates.each do |date| %>
#   <%= BnbDate.find(date_id: date.date_id).date.strftime("%d/%m/%Y") %>