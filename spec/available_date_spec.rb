# frozen_string_literal: true

require_relative '../lib/available_date'

describe AvailableDate do
  it 'creates an Available date' do
    DB.run("INSERT INTO bnb_dates (bnbdate) VALUES ('02-23-2022')")
    Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
    Space.create(name: 'test', description: 'test', price: 10, owner_customer_id: 1)

    available_date = AvailableDate.create(space_id: 1, date_id: 1)

    persisted_date = AvailableDate.find_by_id(space_id: available_date.space_id).first

    expect(available_date).to be_a AvailableDate
    expect(available_date.space_id).to eq persisted_date.space_id
    expect(available_date.date_id).to eq persisted_date.date_id
  end
end
