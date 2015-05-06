require 'spec_helper.rb'

describe 'till', type: :feature, js: true, driver: :poltergeist do
  keys = 'Affogato Price: £14.8 Americano Price: £3.75 Blueberry Muffin Price: £4.05 Cafe Latte Price: £4.75 Cappucino Price: £3.85 Choc Mousse Price: £8.2 Choc Mudcake Price: £6.4 Chocolate Chip Muffin Price: £4.05 Cortado Price: £4.55 Double Espresso Price: £3.75 Flat White Price: £4.75 Muffin Of The Day Price: £4.55 Single Espresso Price: £2.05 Tea Price: £3.65 Tiramisu Price: £11.4'

  phone_number = '+1 (650) 600-708'
  address = '123 Lakeside Way'
  shop_name = 'The Coffee Connection'
  muffin = 'Blueberry Muffin 1 x £4.05'

  before(:each) do
    visit '/'
  end

  it 'the page title is visible' do
    expect(page).to have_content('Coffee shop cash register')
  end
  it 'menu should be visible' do
    expect(page).to have_content(keys)
  end
  it 'phone number should be formatted' do
    expect(page).to have_content(phone_number)
  end
  it 'shop name should be displayed' do
    expect(page).to have_content(shop_name)
  end
  it 'address should be displayed' do
    expect(page).to have_content(address)
  end
  it 'click on a menu item and the order is updated', js: true do
    click_link('Blueberry Muffin')
    visit '/'
    expect(page.first('#dynamic-list li')).to have_content(muffin)
  end
end
