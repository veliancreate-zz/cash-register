require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'

require_relative 'controllers/app'
require_relative 'lib/receipt'
require_relative 'lib/order'
require_relative 'lib/calculator'
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
    redirect '/'
  end

  get '/customer_update' do
    erb :"/../views/index"
  end

  post '/customer_update' do
    @order.table_number = params[:table_number] if params[:table_number]
    @order.add_customer(params[:customer]) if params[:customer]
    erb :"/../views/index"
  end

  get '/receipt_update' do
    @receipt_order = @receipt_list['order']
    @receipt.reset_order(Order)
    @order = @receipt.order
    @order.calculator = Calculator
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  run! if app_file == $PROGRAM_NAME
end
