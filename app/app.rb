require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'
require_relative 'controllers/app'
require_relative 'lib/receipt'
require_relative 'lib/order'

class Till < Sinatra::Base
  enable :sessions

  ORDER = Order.new

  get '/' do
    @order = ORDER
    @receipt = Receipt.new
    json = @receipt.json_object
    @shop_name = json['shopName']
    @phone = @receipt.phone_parser
    @address = json['address']
    @menu = @order.keys_getter
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }

  run! if app_file == $PROGRAM_NAME
end
