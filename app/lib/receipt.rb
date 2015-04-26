require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  attr_accessor :table_number, :tax_percentage
  attr_reader :customers

  include JsonModelHelper

  def date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end

  def number_of_customers
    @customers.count
  end
end
