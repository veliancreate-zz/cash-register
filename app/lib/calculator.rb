require 'json'
require_relative '../helpers/json_helper'

class Calculator
  attr_accessor :tax_percentage, :total, :tax_applied

  include JsonModelHelper

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
      @total += items_getter[item]
    end
    @total.round(2)
  end

  def tax_applied
    @tax_applied = tax_multiplier.round(2)
  end

  private

  def tax_multiplier
    multiply = @tax_percentage / 100.round(3)
    @total * multiply + @total
  end
end
