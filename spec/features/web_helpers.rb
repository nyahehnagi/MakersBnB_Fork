# frozen_string_literal: true

def register_new_user
  visit '/'
  click_button('Register')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'Test Name')
  click_button('Register')
end

def sign_in(email:, password:)
  visit '/'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Log on')
end

def create_new_space
  visit '/spaces/new'
  fill_in :name, with: "test"
  fill_in :description, with: "test description"
  fill_in :price, with: 24.55
  click_button 'New Space'
end

def make_a_booking
  # note, this assumes you are already within the /spaces page and/or the create_new_space method has been run
  click_button 'Make a Booking'
  fill_in :space_id, with: 1
  click_button 'Make booking'
end