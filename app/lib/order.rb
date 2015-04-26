require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number
  attr_reader :customers
  
  include JsonModelHelper

  def add_customer(customer)
    @customers ||= []
    @customers.push(customer)
  end
end
