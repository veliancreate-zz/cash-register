module DiscountsHelper
  def discount_check(item)
    discounted_items.each do |discount|
      discount_iterator(discount, item)
    end
  end

  def discount_iterator(discount, item)
    if item.downcase.include?(discount['product'])
      multiplier = items_getter[item] * discount_multiplier(discount)
      @total += (items_getter[item] - multiplier).round(2)
    else
      @total += items_getter[item]
    end
  end

  def cost_discount
    discounts_selection('cost').sort_by { |discount| discount['cost'] }.last['cost']
  end

  def percentage_discount
    discounts_selection('cost').sort_by { |discount| discount['cost'] }.last['percentage']
  end

  def discounted_items
    discounts_selection('product')
  end

  def discounts_selection(type)
    discounts.select { |discount| discount[type] unless discount[type] == 'NA' }
  end

  def discounts
    File.open('app/json/discounts.json') do |f|
      JSON.parse(f.read)
    end
  end

  def discount_multiplier(discount)
    discount['percentage'] / 100.round(3)
  end
end
