require 'json'
require_relative '../helpers/json_helper'
require_relative '../helpers/discounts_helper'

class Calculator
  attr_accessor :tax_percentage, :total, :tax_applied

  include JsonModelHelper
  include DiscountsHelper

  def initialize(options = {})
    @tax_percentage = options.fetch(:tax_percentage, 5)
  end

  def total_up(order)
    {
      total: total(order),
      tax_applied: tax_applied
    }
  end

  def calculate_change(amount)
    (amount - tax_applied).round(2)
  end

  def total(order)
    @total = 0
    order.items.each do |item|
      discount_check(item)
    end
    @total -= @total * percentage_discount / 100.round(3) if @total > cost_discount
    @total.round(2)
  end

  def tax_applied
    @tax_applied = tax_multiplier.round(2)
  end

  def tax_multiplier
    multiply = @tax_percentage / 100.round(3)
    @total * multiply + @total
  end
end
