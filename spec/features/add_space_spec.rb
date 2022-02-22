feature 'add space' do
  scenario 'owners can add spaces' do

    DB.run("TRUNCATE customers RESTART IDENTITY CASCADE")
    DB.run("INSERT INTO customers (name) VALUES ('test')")
    
    visit('spaces/new')
    fill_in('name', with: 'Big House')
    fill_in('description', with: 'Really big house')
    fill_in('price', with: '10.5')
    fill_in('owner_customer_id', with: '1')
    click_button('New Space')
    expect(page).to have_content 'Big House'
    expect(page).to have_content 'Really big house'
    expect(page).to have_content '10.5'
    expect(page).to have_content '1'

  end
end
