require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  attr_accessor :table_number, :customers, :items, :tax_percentage, :line_order

  include JsonModelHelper

  def initialize
    @tax_percentage = 5
    @customers = []
    @date = date
  end

  def order_getter(order_obj = {})
    @table_number = order_obj[:table_number]
    @customers.push(order_obj[:customers])
    @items = order_obj[:items]
  end

  def date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end

  def number_of_customers
    @customers.count
  end

  def area_code
    '+' + json_object['phone'][0] + ' ' + "(#{json_object['phone'][1, 3]})"
  end

  def phone_parser
    number = json_object['phone'][-6, 3] + '-' + json_object['phone'][-3, 3]
    area_code + ' ' + number
  end
end
