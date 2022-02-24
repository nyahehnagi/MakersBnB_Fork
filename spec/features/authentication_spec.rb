# frozen_string_literal: true

feature 'authentication' do
  it 'a user can sign in' do
    register_new_user
    click_button('Sign out')
    sign_in(email: 'test@example.com', password: 'password123')

    expect(page).to have_content('Welcome, Test Name')
  end

  scenario 'a user sees an error if they get their email wrong' do
    register_new_user
    click_button('Sign out')
    sign_in(email: 'nottherightemail@me.com', password: 'password123')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    register_new_user
    click_button('Sign out')
    sign_in(email: 'test@example.com', password: 'wrongpassword')

    expect(page).not_to have_content('Welcome, Test Name')
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    register_new_user
    click_button('Sign out')

    expect(page).not_to have_content('Welcome, Test Name')
    expect(page).to have_content 'You have signed out.'
  end
end
