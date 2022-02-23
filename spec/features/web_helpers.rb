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