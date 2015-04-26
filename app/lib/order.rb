require 'json'
require_relative '../helpers/json_helper'

class Order
  attr_accessor :table_number
  attr_reader :customers, :items

  include JsonModelHelper

  def add_customer(customer)
    @customers ||= []
    @customers.push(customer)
  end

  def add_items(item)
    @items ||= []
    if items_getter.key?(item)
      @items.push(item)
    else
      fail "Item isn't on the menu"
    end
  end
end
