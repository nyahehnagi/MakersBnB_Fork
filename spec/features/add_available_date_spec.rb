feature "add available date to the space" do

  scenario "can view the add available date page"  do
    # seed the dates available in the drop down
    register_new_user
    visit '/available_dates/new'
    expect(page).to have_content("Add available dates")

  end

  scenario "add a date to the space"  do
    # seed the dates available in the drop down
    
    
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
end