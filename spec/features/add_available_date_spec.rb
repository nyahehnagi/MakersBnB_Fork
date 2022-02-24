feature "add available date to the space" do

  scenario "add a date to the space"  do
    # seed the dates available in thessio drop down
    DB.run("INSERT INTO bnb_dates (date) VALUES ('02-23-2022')")
    
    register_new_user
    # seed a new space
    visit('spaces/new')
    fill_in('name', with: 'Big House')
    fill_in('description', with: 'Really big house')
    fill_in('price', with: '10.5')
    fill_in('owner_customer_id', with: '1')
    click_button('New Space')

    visit '/available_dates/new?space_id=1'
    element = select("23/02/2022", from: "date_select").select_option
    click_button("Add Available Date")
    expect(page).to have_content("23/02/2022")

  end

  scenario "no space id is provided" do
    visit '/available_dates/new'
    expect(page).to have_content("there's no space man.")
  end

  scenario "takes the user back to the spaces page" do
    register_new_user
    visit('spaces/new')
    fill_in('name', with: 'Big House')
    fill_in('description', with: 'Really big house')
    fill_in('price', with: '10.5')
    fill_in('owner_customer_id', with: '1')
    click_button('New Space')

    visit '/available_dates/new?space_id=1'
    click_link("back_to_spaces")
    expect(page).to have_content("Really big house")
  end
end