# frozen_string_literal: true

feature 'View a booking' do
  scenario 'I want to view a space' do
    register_new_user
    create_new_space
    make_a_booking
    expect(page).to have_content "You have booked test description"
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

xfeature 'View Bookings' do
  scenario 'I can view bookings I have made' do
    register_new_user
    create_new_space
    make_a_booking
    click_button 'View bookings'
    expect(page).to have_content "you have 1 booking outstanding"
    expect(page).to have content "name: test"
    expect(page).to have content "description: test description"
    expect(page).to have content "price: £24.55"
    expect(page).to have content "owner: Test Name"
  end
  


  

end
