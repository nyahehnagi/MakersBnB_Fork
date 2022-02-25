# frozen_string_literal: true

feature 'Make a booking' do

  scenario 'I want to view a space' do
    register_new_user
    create_new_space
    make_a_booking
    expect(page).to have_content "You have booked test description"
  end

  scenario 'I cannot make a booking if not logged in' do
    register_new_user
    create_new_space
    click_button 'Sign out'
    visit '/bookings/new'
    fill_in :space_id, with: 1
    click_button 'Make booking'
    expect(page).to have_content "You are not logged on, please logon or register to make a booking"
  end
end

feature 'see the date' do
  scenario 'so that I know when Ive requested a booking' do
    register_new_user
    create_new_space
    make_a_booking
    expect(page).to have_content "You have booked test description for the 2022-02-25"
  end
end

feature 'View Bookings' do
  scenario 'I can view bookings I have made' do
    register_new_user
    create_new_space
    make_a_booking
    click_button 'View Bookings'
    expect(page).to have_content "Booking ID: 1"
    expect(page).to have_content "Customer ID: 1"
    expect(page).to have_content "Space ID: 1"
    expect(page).to have_content "Date: 2022-02-25"
  end
  
end