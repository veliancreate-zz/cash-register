require_relative '../app/lib/receipt.rb'

describe 'a complete receipt includes all the info required' do
  receipt = Receipt.new
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
  it 'customers can be set on the fly' do
    customers = %w(Max Sam Deb Sarah)
    receipt.customers = (customers)
    expect(receipt.customers).to eq(customers)
  end
  it 'number of customers is counted' do
    customers = %w(Max Sam Deb Sarah)
    receipt.customers = (customers)
    expect(receipt.number_of_customers).to eq(4)
  end
  it 'tax precentage can be set and got' do
    receipt.tax_percentage = 8.75
    expect(receipt.tax_percentage).to eq(8.75)
  end
end
