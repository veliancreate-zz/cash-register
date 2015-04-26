require 'capybara/rspec'
require_relative '../../app/lib/receipt.rb'

feature 'a complete receipt displays all the info required' do
  receipt = Receipt.new
  date = Time.now.strftime('%D')
  time = Time.now.strftime('%T')
  receipt.customers = %w(Max Sam Deb Sarah)
  receipt.tax_percentage = 8.75
  scenario 'an order is placed' do
    expect(receipt.date).to eq(date + ' ' + time)
    expect(receipt.customers).to eq(%w(Max Sam Deb Sarah))
    expect(receipt.number_of_customers).to eq(4)
    expect(receipt.tax_percentage).to eq(8.75)
  end
end
