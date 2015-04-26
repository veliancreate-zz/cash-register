require_relative '../app/lib/receipt.rb'

describe 'a complete receipt includes all the info required' do
  receipt = Receipt.new
  prices = { 'Cafe Latte' => 4.75, 'Flat White' => 4.75, 'Cappucino' => 3.85, 'Single Espresso' => 2.05, 'Double Espresso' => 3.75, 'Americano' => 3.75, 'Cortado' => 4.55, 'Tea' => 3.65, 'Choc Mudcake' => 6.4, 'Choc Mousse' => 8.2, 'Affogato' => 14.8, 'Tiramisu' => 11.4, 'Blueberry Muffin' => 4.05, 'Chocolate Chip Muffin' => 4.05, 'Muffin Of The Day' => 4.55 }
  it 'has date, customers, table_number, and tax_percentage' do
    expect(receipt).to respond_to(:date)
    expect(receipt).to respond_to(:customers)
    expect(receipt).to respond_to(:table_number)
    expect(receipt).to respond_to(:tax_percentage)
  end
  it 'date variable is the current date' do
    date = Time.now.strftime('%D')
    time = Time.now.strftime('%T')
    expect(receipt.date).to eq(date + ' ' + time)
  end
  it 'tax precentage can be set and got' do
    receipt.tax_percentage = 8.75
    expect(receipt.tax_percentage).to eq(8.75)
  end
  it 'returns the prices in the JSON object' do
    expect(receipt.prices).to eq(prices)
  end
end
