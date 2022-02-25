# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

require './database_setup'
require './lib/space'
require './lib/customer'
require './lib/bnb_date'
require './lib/booking'
require './lib/available_date'

require_relative './controllers/customer_controller'
require_relative './controllers/session_controller'
require_relative './controllers/available_date_controller'

# Maker House a Home
class Mahah < Sinatra::Base
  use CustomerController
  use SessionController
  use AvailableDateController

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  enable :sessions

  get '/' do
    @customer = Customer.find(customer_id: session[:customer_id])
    erb :"/index"
  end

  get '/spaces/new' do
    erb :"spaces/new"
  end

  post '/spaces' do
    if session[:customer_id] != nil
      Space.create(name: params[:name], description: params[:description], price: params[:price],
      owner_customer_id: session[:customer_id])
      redirect to '/spaces'
    else
      flash[:notice] = "You are not logged on, please logon or register to add a space"
      redirect to '/'
    end

  end

  get '/spaces' do
    @customer = Customer.find(customer_id: session[:customer_id])
    @spaces = Space.all

    erb :"spaces/index"
  end

  get '/bookings/new' do
    @spaces = Space.all
    erb :"bookings/new"
  end

  get '/bookings' do
    erb :"bookings/index"
  end

  post '/bookings' do
    if session[:customer_id] != nil
      session[:booking_date] = params[:booking_date]
      session[:property] = Space.find(space_id: params[:space_id])
      Booking.create(customer_id: session[:customer_id], space_id: session[:property].space_id, date_of_stay: params[:booking_date])
      Space.filter(space_id: params[:space_id]).update(hire_customer_id: session[:customer_id])
      redirect '/bookings'
    else
      flash[:notice] = "You are not logged on, please logon or register to make a booking"
      redirect to '/'
    end
  end

  get '/mybookings' do
    @trips = Booking.where(customer_id: session[:customer_id])
    @properties = Space.where(owner_customer_id: session[:customer_id])
    p "properties count = #{@properties.count}"
    if @properties.count != "0"
      @properties.each do |property|
        @lettings = Booking.where(space_id: property.space_id)
      end
    end
    if @trips.count == 0 && @properties.count == 0
      flash[:notice] = "You have no bookings"
      redirect to '/nobookings'
    end
    erb :"mybookings/index"
  end

  get '/nobookings' do
    erb :"nobookings/index"
  end

  run! if app_file == $PROGRAM_NAME
end
