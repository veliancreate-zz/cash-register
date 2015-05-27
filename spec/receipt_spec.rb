require_relative '../app/lib/receipt.rb'

describe 'a complete receipt includes all the info required' do
  items = {    'Cafe Latte' => 4.75,
               'Flat White' => 4.75,
               'Cappucino' => 3.85,
               'Single Espresso' => 2.05,
               'Double Espresso' => 3.75,
               'Americano' => 3.75,
               'Cortado' => 4.55,
               'Tea' => 3.65,
               'Choc Mudcake' => 6.4,
               'Choc Mousse' => 8.2,
               'Affogato' => 14.8,
               'Tiramisu' => 11.4,
               'Blueberry Muffin' => 4.05,
               'Chocolate Chip Muffin' => 4.05,
               'Muffin Of The Day' => 4.55 }
  let(:order) do
    double :order,
           table_number: 4,
           customers: 'Jane',
           items: ['Flat White', 'Single Espresso', 'Double Espresso']
  end
  let(:order_class) { double :order_class, new: order }
  let(:receipt) { Receipt.new(order_class) }
  it 'date variable is the current date' do
    date = Time.now.strftime('%D')
    time = Time.now.strftime('%T')
    expect(receipt.date).to eq(date + ' ' + time)
  end
  it 'returns the prices in the JSON object' do
    expect(receipt.items_getter).to eq(items)
  end
  it 'can present the phone number in the required format' do
    phone_number = '+1 (650) 600-708'
    expect(receipt.phone_parser).to eq(phone_number)
  end
end
