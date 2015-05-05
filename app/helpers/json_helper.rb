module JsonModelHelper
  def json_object
    menu = File.read('app/json/hipstercoffee.json')
    JSON.parse(menu)[0]
  end

  def discounts
    File.open('app/json/discounts.json') do |f|
      JSON.parse(f.read)
    end
  end

  def format_discounts
    strings = []
    discounts.each do |discount|
      if discount['product'] == 'NA'
        strings << "Discounts of #{discount['percentage']}% on orders over £#{discount['cost']}"
      else
        strings << "Discounts of #{discount['percentage']}% on any #{discount['product']}"
      end
    end
    strings
  end

  def items_getter
    json_object['prices'][0]
  end

  def keys_getter
    items_getter.keys.sort
  end
end
