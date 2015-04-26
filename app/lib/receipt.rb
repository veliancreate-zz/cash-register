require 'date'

class Receipt
  attr_accessor :customers, :table_number, :tax_percentage
  attr_reader :date
  def set_date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end
end
