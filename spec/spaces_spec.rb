require_relative '../lib/space'

describe Space do
  describe 'saving to the database' do
    it 'creates a new space' do
      # customer needed as there's a FK link in the space table
      customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
      space = Space.create(name: 'test', description: 'test description', price: 10.00, owner_customer_id: 1)
      persisted_space = Space.find(space_id: space.space_id)

      expect(space).to be_a Space
      expect(space.name).to eq persisted_space.name
      expect(space.description).to eq persisted_space.description
      expect(space.price).to eq persisted_space.price
      expect(space.owner_customer_id).to eq persisted_space.owner_customer_id
    end
  end
end