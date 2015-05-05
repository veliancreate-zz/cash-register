require_relative '../app/lib/calculator.rb'

describe 'Calculator' do
  calculator = Calculator.new
  let(:order) do
    double :order,
           table_number: 4,
           customers: 'Jane',
           items: ['Flat White',
                   'Single Espresso',
                   'Flat White',
                   'Double Espresso',
                   'Single Espresso']
  end
  it 'can calculate total of order' do
    expect(calculator.total_up(order)[:total]).to eq(17.35)
  end

  it 'can calculate the total due including VAT' do
    calculator.total_up(order)
    expect(calculator.tax_applied).to eq(18.22)
  end

  it 'can calculate the correct change' do
    calculator.total_up(order)
    expect(calculator.calculate_change(20)).to eq(1.78)
  end

  it 'can display the amount due if the amount given is below the total due' do
    calculator.total_up(order)
    expect(calculator.calculate_change(15)).to eq(-3.22)
  end
end
