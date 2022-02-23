class SessionController < Sinatra::Base

  set :views, Proc.new { File.join(File.dirname(__FILE__), '..', "views") }

  register Sinatra::Flash
  enable :sessions

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    customer = Customer.authenticate(email: params[:email], password: params[:password])
    if customer
      session[:customer_id] = customer.customer_id
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'

    end
    
  end

  post '/sessions/delete' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end


end