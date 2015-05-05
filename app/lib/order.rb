require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number, :items, :customers, :line_order
  attr_reader :calculator

  include JsonModelHelper

  def initialize(options = {})
    @customers = options.fetch(:customers, [])
    @items = options.fetch(:items, [])
    @table_number = options.fetch(:table_number, 1)
    @line_order = []
    calculator = options.fetch(:calculator, nil)
    @calculator = calculator.new if calculator
  end

  def calculator=(calculator)
    @calculator = calculator.new
  end

  def total_up
    @calculator.total_up(self)
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

  def line_order
    @items.each do |item|
      line = {  item: item,
                number: @items.count(item),
                item_price:  items_getter[item]
              }
      @line_order.push(line)
    end
    @line_order.reverse!.uniq! { |line| line[:item] }
    @line_order.sort_by! { |line| line[:item] }
  end

  def to_json
    {
      items: @items,
      table_number: @table_number,
      tax_percentage: @calculator.tax_percentage,
      tax_applied: total_up[:tax_applied],
      customers: @customers,
      line_order: line_order,
      total: total_up[:total]
    }
  end
end
