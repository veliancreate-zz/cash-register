require 'capybara/rspec'

feature 'the till has all the elements it needs' do
  keys = 'Affogato Price: £14.8 Americano Price: £3.75 Blueberry Muffin Price: £4.05 Cafe Latte Price: £4.75 Cappucino Price: £3.85 Choc Mousse Price: £8.2 Choc Mudcake Price: £6.4 Chocolate Chip Muffin Price: £4.05 Cortado Price: £4.55 Double Espresso Price: £3.75 Flat White Price: £4.75 Muffin Of The Day Price: £4.55 Single Espresso Price: £2.05 Tea Price: £3.65 Tiramisu Price: £11.4'

  phone_number = '+1 (650) 600-708'
  address = '123 Lakeside Way'
  shop_name = 'The Coffee Connection'
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content('Coffee shop cash register')
  end
  scenario 'menu should be visible' do
    visit '/'
    expect(page).to have_content(keys)
  end
  scenario 'phone number should be formatted' do
    visit '/'
    expect(page).to have_content(phone_number)
  end
  scenario 'shop name should be displayed' do
    visit '/'
    expect(page).to have_content(shop_name)
  end
  scenario 'address should be displayed' do
    visit '/'
    expect(page).to have_content(address)
  end
end
