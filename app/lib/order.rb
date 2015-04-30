require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number, :tax_percentage, :items
  attr_reader :customers

  include JsonModelHelper

  def initialize(options = {})
    @customers = options.fetch(:customers, [])
    @items = options.fetch(:items, [])
    @tax_percentage = options.fetch(:tax_percentage, 5)
    @table_number = options.fetch(:table_number, 1)
  end

  def add_customer(customer)
    @customers.push(customer)
  end

  def add_item(item)
    if items_getter.key?(item)
      @items.push(item)
    else
      fail "Item isn't on the menu"
    end
  end

  def remove_item(item)
    @items.delete(item)
  end

  def total
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
    @line_order = line_order_array.uniq
  end
end
