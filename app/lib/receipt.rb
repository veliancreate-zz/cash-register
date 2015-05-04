require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  attr_accessor :order

  include JsonModelHelper

  def initialize(order)
    @order = order.new
  end

  def reset_order(order)
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

  def customer_count
    @order.customers.length
  end

  def to_json
    {
      shop_name: json_object['shopName'],
      phone: phone_parser,
      address: json_object['address'],
      order: order.to_json,
      date: date,
      customers_count: customer_count
    }
  end

  def write_json
    File.write('app/receipt.json', JSON.pretty_generate(to_json))
  end

  def read_json
    write_json
    File.open('app/receipt.json') do |f|
      JSON.parse(f.read)
    end
  end
end
