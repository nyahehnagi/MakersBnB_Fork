# frozen_string_literal: true

feature 'add space' do
  scenario 'owners can add spaces' do
    register_new_user
    visit('spaces/new')
    fill_in('name', with: 'Big House')
    fill_in('description', with: 'Really big house')
    fill_in('price', with: '10.5')
    click_button('New Space')
    expect(page).to have_content 'Big House'
    expect(page).to have_content 'Really big house'
    expect(page).to have_content '10.5'
  end

  scenario 'a space cannot be added if you aren not logged in' do
    visit('spaces/new')
    fill_in('name', with: 'Big House')
    fill_in('description', with: 'Really big house')
    fill_in('price', with: '10.5')
    click_button('New Space')
    expect(page).to have_content 'You are not logged on, please logon or register to add a space'
  end
end
