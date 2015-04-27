# require 'capybara/rspec'

# feature 'the till has all the elements it needs' do
#   keys = 'Affogato Americano Blueberry Muffin Cafe Latte Cappucino Choc Mousse Choc Mudcake Chocolate Chip Muffin Cortado Double Espresso Flat White Muffin Of The Day Single Espresso Tea Tiramisu'
#   phone_number = '+1 (650) 600-708'
#   address = '123 Lakeside Way'
#   shop_name = 'The Coffee Connection'
#   scenario 'the page title is visible' do
#     visit '/'
#     expect(page).to have_content('Coffee shop cash register')
#   end
#   scenario 'menu should be visible' do
#     visit '/'
#     expect(page).to have_content(keys)
#   end
#   scenario 'phone number should be formatted' do
#     visit '/'
#     expect(page).to have_content(phone_number)
#   end
#   scenario 'shop name should be displayed' do
#     visit '/'
#     expect(page).to have_content(shop_name)
#   end
#   scenario 'address should be displayed' do
#     visit '/'
#     expect(page).to have_content(address)
#   end
# end
