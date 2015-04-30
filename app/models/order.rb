require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number
  attr_reader :customers, :items

  include JsonModelHelper

  def initialize
    @customers = []
    @items = []
    @tax_percentage = 5
  end

  def total_order
    total = 0
    @items.each do |item|
      total += items_getter[item]
    end
    total
  end

  def line_order
    line_order_array ||= []
    @items.each do |item|
      line = { item: item, number: @items.count(item) }
      line_order_array.push(line)
    end
    line_order_array.uniq
  end

  def add_customer(customer)
    @customers.push(customer)
  end

  def add_items(item)
    if items_getter.key?(item)
      @items.push(item)
    else
      fail "Item isn't on the menu"
    end
  end
end
