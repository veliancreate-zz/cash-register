require_relative '../app/lib/receipt.rb'

describe 'a complete receipt includes all the info required' do
  receipt = Receipt.new
  items = { 'Cafe Latte' => 4.75, 'Flat White' => 4.75, 'Cappucino' => 3.85, 'Single Espresso' => 2.05, 'Double Espresso' => 3.75, 'Americano' => 3.75, 'Cortado' => 4.55, 'Tea' => 3.65, 'Choc Mudcake' => 6.4, 'Choc Mousse' => 8.2, 'Affogato' => 14.8, 'Tiramisu' => 11.4, 'Blueberry Muffin' => 4.05, 'Chocolate Chip Muffin' => 4.05, 'Muffin Of The Day' => 4.55 }
  let(:order) { { table_number: 4, customers: 'Jane', items: ['Flat White', 'Single Espresso', 'Double Espresso'] } }
  let(:order_more) { { table_number: 4, customers: 'Jane', items: ['Flat White', 'Single Espresso', 'Flat White', 'Double Espresso', 'Single Espresso'] } }

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
    receipt.tax_percentage = 10
    expect(receipt.tax_percentage).to eq(10)
  end
  it 'returns the prices in the JSON object' do
    expect(receipt.items_getter).to eq(items)
  end
  it 'can get an order and populate accordingly' do
    receipt.order_getter(order)
    expect(receipt.customers).to eq(['Jane'])
    expect(receipt.items).to eq(['Flat White', 'Single Espresso', 'Double Espresso'])
    expect(receipt.table_number).to eq(4)
    expect(receipt.number_of_customers).to eq(1)
  end
  it 'can calculate total of order' do
    receipt.order_getter(order)
    expect(receipt.total_order).to eq(10.55)
  end
  it 'can count the items in an order' do
    receipt.order_getter(order_more)
    expect(receipt.line_order).to eq([{ item: 'Flat White', number: 2 }, { item: 'Single Espresso', number: 2 }, { item: 'Double Espresso', number: 1 }])
  end
end
