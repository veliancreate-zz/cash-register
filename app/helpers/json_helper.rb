module JsonModelHelper
  def json_object
    menu = File.read('app/hipstercoffee.json')
    JSON.parse(menu)
  end

  def items_getter
    json_object[0]['prices'][0]
  end
end
