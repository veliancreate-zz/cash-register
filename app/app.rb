require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'
require 'sinatra/activerecord'

require_relative '../config/environments'
require_relative 'controllers/app'
require_relative 'lib/receipt'
require_relative 'lib/order'

class Till < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get '/' do
    @order = Order.new
    json = @order.json_object
    @shop_name = json['shopName']
    @phone = @order.phone_parser
    @address = json['address']
    @menu = @order.keys_getter
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }
end
