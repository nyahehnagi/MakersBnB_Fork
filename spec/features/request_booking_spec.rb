# frozen_string_literal: true

feature 'View a booking' do
  scenario 'I want to view a space' do
    register_new_user
    visit('/spaces/new')
    fill_in :name, with: "test"
    fill_in :description, with: "test description"
    fill_in :price, with: 24.55
    fill_in :owner_customer_id, with: 1
    click_button 'New Space'
    click_button 'Make a Booking'
    fill_in :space_id, with: 1
    click_button 'Make booking'
    expect(page).to have_content "You have booked test description"
  end
end

xfeature 'View Bookings' do
  scenario 'I can view bookings I have made' do
    register_new_user
    visit('/spaces/new')
    fill_in :name, with: "test"
    fill_in :description, with: "test description"
    fill_in :price, with: 24.55
    fill_in :owner_customer_id, with: 1
    click_button 'New Space'
    click_button 'Make a Booking'
    fill_in :space_id, with: 1
    click_button 'Make booking'
    click_button 'View bookings'
    expect(page).to have_content "you have 1 booking outstanding"
    expect(page).to have content "name: test"
    expect(page).to have content "description: test description"
    expect(page).to have content "price: £24.55"
    expect(page).to have content "owner: Test Name"
  end
end
