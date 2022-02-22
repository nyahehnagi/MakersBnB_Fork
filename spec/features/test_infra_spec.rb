# frozen_string_literal: true

feature 'test infrastructure' do
  scenario 'it makes sure the web app works' do
    visit '/'
    expect(page).to have_content 'OK LESSSS GOOOO'
  end
end
