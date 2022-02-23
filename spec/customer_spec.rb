require_relative '../lib/customer'

describe Customer do

  describe 'saving to the database' do
    it 'creates a new user' do
      customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
  
      persisted_customer = Customer.find(customer_id: customer.customer_id)

      expect(customer).to be_a Customer
      expect(customer.customer_id).to eq persisted_customer.customer_id
      expect(customer.name).to eq persisted_customer.name
      expect(customer.email).to eq persisted_customer.email
    end

    it 'hashes the password using BCrypt' do
      customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
      expect(BCrypt::Password.new(customer.password)).to eq  'password123'
      
    end

    it 'does not allow duplicate email addresses' do
      customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
      customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Another Name')

      expect(customer).to be_nil
    end


    it 'does not allow an empty email address' do
      expect(Customer.create(email: '', password: 'password123', name: 'Another Name')).to be_nil
    end

    it 'does not allow an empty password' do
      expect(Customer.create(email: 'test@example.com', password: '', name: 'Test Name')).to be_nil
    end


    it 'does not allow an empty name' do
      expect(Customer.create(email: 'test@example.com', password: 'password123', name: '')).to be_nil
    end

  end

  describe ".authenticate" do
    before(:each) do
      @customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
    end

    it 'returns a customer given a correct username and password, if one exists' do
      authenticated_cust = Customer.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_cust.customer_id).to eq @customer.customer_id
    end

    it 'returns nil given an incorrect email address' do
      expect(Customer.authenticate(email: 'wrongemail@mail.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(Customer.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end

  end

end
