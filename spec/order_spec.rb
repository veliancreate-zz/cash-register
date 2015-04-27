require_relative '../app/lib/order.rb'

describe 'Orders' do
  order = Order.new
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
  it 'can add items' do
    items = ['Cafe Latte', 'Cafe Latte', 'Flat White', 'Cappucino']
    order.add_items('Cafe Latte')
    order.add_items('Cafe Latte')
    order.add_items('Flat White')
    order.add_items('Cappucino')
    expect(order.items).to eq(items)
  end
end
