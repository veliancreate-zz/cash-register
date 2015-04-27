require_relative '../app/lib/order.rb'

describe 'Orders' do
  order = Order.new
  items = { 'Cafe Latte' => 4.75, 'Flat White' => 4.75, 'Cappucino' => 3.85, 'Single Espresso' => 2.05, 'Double Espresso' => 3.75, 'Americano' => 3.75, 'Cortado' => 4.55, 'Tea' => 3.65, 'Choc Mudcake' => 6.4, 'Choc Mousse' => 8.2, 'Affogato' => 14.8, 'Tiramisu' => 11.4, 'Blueberry Muffin' => 4.05, 'Chocolate Chip Muffin' => 4.05, 'Muffin Of The Day' => 4.55 }
  order_less = Order.new(table_number: 4, customers: 'Jane', items: ['Flat White', 'Single Espresso', 'Double Espresso'])
  order_more = Order.new(table_number: 4, customers: 'Jane', items: ['Flat White', 'Single Espresso', 'Flat White', 'Double Espresso', 'Single Espresso'])
  it 'multiple customers can be added' do
    customers = %w(Max Sam Deb Sarah)
    order.add_customer('Max')
    order.add_customer('Sam')
    order.add_customer('Deb')
    order.add_customer('Sarah')
    expect(order.customers).to eq(customers)
  end
  it "throws an error if the item isn't on the menu" do
    expect { order.add_items('Burger') }.to raise_error
  end
  it 'returns the prices in the JSON object' do
    expect(order.items_getter).to eq(items)
  end
  it 'can add items' do
    items = ['Cafe Latte', 'Cafe Latte', 'Flat White', 'Cappucino']
    order.add_items('Cafe Latte')
    order.add_items('Cafe Latte')
    order.add_items('Flat White')
    order.add_items('Cappucino')
    expect(order.items).to eq(items)
  end
  it 'can remove items' do
    order.items = []
    order.add_items('Cafe Latte')
    order.add_items('Cafe Latte')
    order.add_items('Flat White')
    order.add_items('Cappucino')
    order.remove_items('Cafe Latte')
    expect(order.items).to eq(['Cafe Latte', 'Flat White', 'Cappucino'])
  end
  it 'can calculate total of order' do
    expect(order_less.total).to eq(10.55)
  end
  it 'can count the items in an order' do
    expect(order_more.line_order).to eq([{ item: 'Flat White', number: 2 }, { item: 'Single Espresso', number: 2 }, { item: 'Double Espresso', number: 1 }])
  end
end
