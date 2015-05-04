require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number, :tax_percentage, :items, :tax_applied, :customers, :line_order

  include JsonModelHelper

  def initialize(options = {})
    @customers = options.fetch(:customers, [])
    @items = options.fetch(:items, [])
    @tax_percentage = options.fetch(:tax_percentage, 5)
    @table_number = options.fetch(:table_number, 1)
    @line_order = []
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
    @total = 0
    @items.each do |item|
      @total += items_getter[item]
    end
    @total.round(2)
  end

  def tax_applied
    @tax_applied = 0
    multiply = @tax_percentage / 100.round(3)
    vat = total * multiply
    @tax_applied += vat + total
    @tax_applied.round(2)
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
      tax_percentage: @tax_percentage,
      tax_applied: tax_applied,
      customers: @customers,
      line_order: line_order,
      total: total
    }
  end
end
