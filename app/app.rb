require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'

require_relative 'controllers/app'
require_relative 'lib/receipt'
require_relative 'lib/order'
require_relative 'helpers/objects'

class Till < Sinatra::Base
  enable :sessions

  helpers ObjectsGetter

  RECEIPT = Receipt.new(Order)

  before '/*' do
    @receipt = RECEIPT
    objects_getter
  end

  get '/' do
    erb :"/../views/index"
  end

  get '/add_item' do
    erb :"/../views/index"
  end

  post '/add_item' do
    @order.add_item(params[:product])
    body json(order: @order.to_json)
  end

  get '/receipt_update' do
    @receipt_order = @receipt_list['order']
    @receipt.reset_order(Order)
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, 'public') }

  run! if app_file == $PROGRAM_NAME
end
