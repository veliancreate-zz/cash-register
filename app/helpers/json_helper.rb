module JsonModelHelper
  def json_object
    menu = File.read('app/hipstercoffee.json')
    JSON.parse(menu)
  end
end
