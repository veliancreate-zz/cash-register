module JsonModelHelper
  def json_object
    menu = File.read('app/hipstercoffee.json')
    return_val = JSON.parse(menu)
    return_val[0]
  end

  def items_getter
    json_object['prices'][0]
  end

  def keys_getter
    items_getter.keys.sort
  end

  def area_code
    '+' + json_object['phone'][0] + ' ' + "(#{json_object['phone'][1, 3]})"
  end

  def phone_parser
    number = json_object['phone'][-6, 3] + '-' + json_object['phone'][-3, 3]
    area_code + ' ' + number
  end
end
