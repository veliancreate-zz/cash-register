require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number, :tax_percentage, :items
  attr_reader :customers

  include JsonModelHelper

  def initialize(options = {})
    @table_number = options.fetch(:table_number, 1)
    @customers = options.fetch(:customers, [])
    @items = options.fetch(:items, [])
    @tax_percentage = options.fetch(:tax_percentage, 5)
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

  def remove_items(item_remove)
    @items.delete_at(@items.find_index(item_remove))
  end

  def total
    @total = 0
    @items.each do |item|
      @total += items_getter[item]
    end
    @total
  end

  def line_order
    @line_order ||= []
    @items.each do |item|
      line = { item: item, number: @items.count(item) }
      @line_order.push(line)
    end
    @line_order.uniq
  end
end
