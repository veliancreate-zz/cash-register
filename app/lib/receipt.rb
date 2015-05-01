require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  attr_accessor :order

  include JsonModelHelper

  def initialize(order)
    @order = order.new
  end

  def date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end

  def area_code
    '+' + json_object['phone'][0] + ' ' + "(#{json_object['phone'][1, 3]})"
  end

  def phone_parser
    number = json_object['phone'][-6, 3] + '-' + json_object['phone'][-3, 3]
    area_code + ' ' + number
  end
end
