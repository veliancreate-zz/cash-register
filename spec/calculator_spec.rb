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
  let(:order_jane) do
    double :order,
           table_number: 4,
           customers: 'Jane',
           items: ['Cafe Latte',
                   'Cafe Latte',
                   'Blueberry Muffin',
                   'Choc Mudcake']
  end
  let(:order_john) do
    double :order,
           table_number: 4,
           customers: 'John',
           items: ['Americano',
                   'Americano',
                   'Americano',
                   'Americano',
                   'Tiramisu',
                   'Tiramisu',
                   'Blueberry Muffin',
                   'Blueberry Muffin',
                   'Blueberry Muffin',
                   'Blueberry Muffin',
                   'Blueberry Muffin']
  end

  let(:order_final) do
    double :order,
           table_number: 4,
           customers: 'John',
           items: ['Americano',
                   'Americano',
                   'Americano',
                   'Americano',
                   'Tiramisu',
                   'Tiramisu',
                   'Blueberry Muffin',
                   'Blueberry Muffin',
                   'Muffin Of The Day',
                   'Chocolate Chip Muffin',
                   'Muffin Of The Day']
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

  it 'can calculate proper discounts' do
    expect(calculator.total_up(order_jane)).to eq(total: 19.54, tax_applied: 20.52)
  end

  it 'can calculate proper discounts' do
    expect(calculator.total_up(order_john)).to eq(total: 53.20, tax_applied: 55.86)
  end
  it 'can calculate proper discounts' do
    expect(calculator.total_up(order_final)).to eq(total: 54.07, tax_applied: 56.78)
  end
end
