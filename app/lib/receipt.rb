require 'date'

class Receipt
  attr_accessor :table_number, :tax_percentage
  attr_reader :date, :customers

  def set_date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end

  def customers=(customers = [])
    @customers = []
    customers.each { |customer| @customers.push(customer) }
  end

  def number_of_customers
    @customers.count
  end
end
