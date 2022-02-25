describe Booking do
  describe 'saving to the database' do
    it 'creates a new booking' do
      customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
      space = Space.create(name: 'test', description: 'test description', price: 10.00, owner_customer_id: 1)
      booking = Booking.create(customer_id: 1, space_id: 1, date_of_stay: '2022-02-25')
      persisted_space = Booking.find(booking_id: booking.booking_id)

      expect(booking).to be_a Booking
      expect(booking.customer_id).to eq persisted_space.customer_id
      expect(booking.space_id).to eq persisted_space.space_id
      expect(booking.date_of_stay).to eq persisted_space.date_of_stay
    end
  end
end