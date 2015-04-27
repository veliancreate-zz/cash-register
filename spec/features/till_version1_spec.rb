require 'capybara/rspec'

feature 'the till has all the elements it needs' do
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content('Coffee shop cash register')
  end
end
