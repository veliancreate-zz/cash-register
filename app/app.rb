require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'
require_relative 'controllers/app'
require_relative 'lib/receipt'
require_relative 'lib/order'

class Till < Sinatra::Base
  enable :sessions

  get '/' do
    order = Order.new
    receipt = Receipt.new
    json = order.json_object
    @shop_name = json['shopName']
    @phone = order.phone_parser
    @address = json['address']
    @menu = order.keys_getter
    @receipt = receipt
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }

  run! if app_file == $PROGRAM_NAME
end
