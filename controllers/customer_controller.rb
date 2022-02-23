class CustomerController < Sinatra::Base

  set :views, Proc.new { File.join(File.dirname(__FILE__), '..', "views") }

  #register Sinatra::Flash
  enable :sessions

  get '/customers/new' do
    erb :"customers/new"
  end
  
  post '/customers' do

    customer = Customer.new(
      email: params['email'], password: params['password'], 
      name: params['name']
    )

    if customer.valid?
      customer.save
      session[:customer_id] = customer.customer_id
      redirect('/spaces')
    else
      flash[:notice] = 'Invalid details'
      redirect('/customers/new')
    end
  end
  
end