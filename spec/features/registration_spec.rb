feature 'registration' do
  scenario 'a user can sign up' do

    visit '/'
    click_button('Register')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    click_button('Register')
    
    expect(page).to have_content "Welcome, Test Name"
  end
  
  scenario 'a user signs up with an email that already exists' do
    visit '/'
    click_button('Register')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    click_button('Register')

    click_button("Sign out")

    click_button 'Register'
  
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    click_button('Register')

    expect(page).to have_content "Invalid details"
  end

end
