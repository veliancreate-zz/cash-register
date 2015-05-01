require_relative '../app/lib/order.rb'

describe 'Orders' do
  order = Order.new
  order_more = Order.new(table_number: 4, customers: 'Jane', items: ['Flat White', 'Single Espresso', 'Flat White', 'Double Espresso', 'Single Espresso'])
  items = ['Cafe Latte', 'Cafe Latte', 'Flat White', 'Cappucino']
  it 'multiple customers can be added' do
    customers = %w(Max Sam Deb Sarah)
    order.add_customer('Max')
    order.add_customer('Sam')
    order.add_customer('Deb')
    order.add_customer('Sarah')
    expect(order.customers).to eq(customers)
  end
  it "throws an error if the item isn't on the menu" do
    expect { order.add_item('Burger') }.to raise_error
  end
  it 'can add items' do
    order.add_item('Cafe Latte')
    order.add_item('Cafe Latte')
    order.add_item('Flat White')
    order.add_item('Cappucino')
    expect(order.items).to eq(items)
  end
  it 'can remove items' do
    order.items = []
    order.add_item('Cafe Latte')
    order.add_item('Cafe Latte')
    order.add_item('Flat White')
    order.add_item('Cappucino')
    order.remove_item('Cappucino')
    expect(order.items).to eq(['Cafe Latte', 'Cafe Latte', 'Flat White'])
  end

  it 'can calculate total of order' do
    expect(order_more.total).to eq(17.35)
  end
  it 'can count the items in an order' do
    expect(order_more.line_order).to eq([{ item: 'Double Espresso', number: 1 }, { item: 'Flat White', number: 2 }, { item: 'Single Espresso', number: 2 }])
  end
end
