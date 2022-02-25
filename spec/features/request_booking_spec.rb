# frozen_string_literal: true

feature 'View a booking' do
  scenario 'I want to view a space' do
    visit('/bookings/new')
    click_button 'Make booking'
    expect(page).to have_content "You have booked dash's small red house for 1 night!"
  end
end
