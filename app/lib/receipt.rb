require 'date'
require 'json'
require_relative '../helpers/json_helper'

class Receipt
  attr_accessor :table_number, :customers, :items, :date, :tax_percentage, :number_of_customers

  include JsonModelHelper

  def initialize
    @tax_percentage = 8.75
  end

  def order_getter(order_obj = {})
    @table_number = order_obj[:table_number]
    @customers ||= []
    @customers.push(order_obj[:customers])
    @items = order_obj[:items]
    @date = date
    @number_of_customers = customers_count
  end

  def date
    time = Time.now.strftime('%T')
    date = Time.now.strftime('%D')
    @date = date + ' ' + time
  end

  def customers_count
    @customers.count
  end

  def total_order
    total = 0
    @items.each do |item|
      total += items_getter[item]
    end
    total
  end
end
