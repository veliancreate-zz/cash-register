module JsonModelHelper
  def json_object
    menu = File.read('app/json/hipstercoffee.json')
    JSON.parse(menu)[0]
  end

  def items_getter
    json_object['prices'][0]
  end

  def keys_getter
    items_getter.keys.sort
  end
end
