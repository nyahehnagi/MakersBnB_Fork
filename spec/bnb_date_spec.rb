# frozen_string_literal: true

require_relative '../lib/bnb_date'

describe BnbDate do
  it 'creates a bnb date' do
    bnb_date = BnbDate.create(date: '23-02-2022')
    persisted_date = BnbDate.find(date_id: bnb_date.date_id)

    expect(persisted_date.date).to eq bnb_date.date
  end

  it 'returns dates that have not been used yet' do
    customer = Customer.create(email: 'test@example.com', password: 'password123', name: 'Test User')
    space = Space.create(name: 'test', description: 'test', price: 10, owner_customer_id: customer.customer_id)

    date_used = BnbDate.create(date: '23-02-2022')
    date_not_used = BnbDate.create(date: '24-02-2022')

    AvailableDate.create(space_id: space.space_id, date_id: date_used.date_id)

    usable_dates = BnbDate.usable_dates_by_space(space_id: space.space_id)
    expect(usable_dates.count).to eq 1
    expect(usable_dates.first.date_id).to eq date_not_used.date_id
    expect(usable_dates.first.date).to eq date_not_used.date
  end
end
