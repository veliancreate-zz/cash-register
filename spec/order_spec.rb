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
end
