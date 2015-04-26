require_relative '../app/lib/receipt.rb'

describe 'a complete receipt includes all the info required' do
  receipt = Receipt.new
  it 'has date, customers, table_numbers, and tax_percentage' do
    expect(receipt).to respond_to(:date)
    expect(receipt).to respond_to(:customers)
    expect(receipt).to respond_to(:table_number)
    expect(receipt).to respond_to(:tax_percentage)
  end
  it 'date variable is the current date' do
    date = Time.now.strftime('%D')
    time = Time.now.strftime('%T')
    receipt.set_date
    expect(receipt.date).to eq(date + ' ' + time)
  end
end
