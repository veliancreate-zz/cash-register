module Calculator
  def total
    @total = 0
    @items.each do |item|
      @total += items_getter[item]
    end
    @total.round(2)
  end

  def tax_applied
    @tax_applied = 0
    @tax_applied = tax_multiplier.round(2)
  end

  def tax_multiplier
    multiply = @tax_percentage / 100.round(3)
    total * multiply + total
  end

  def calculate_change(amount_given)
    (amount_given - tax_applied).round(2)
  end
end
