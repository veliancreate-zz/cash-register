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
  enable :method_override

  helpers ObjectsGetter

  RECEIPT = Receipt.new(Order)

  before '/*' do
    @receipt = RECEIPT
    objects_getter
  end

  get '/' do
    erb :"/../views/index"
  end

  post '/add_item' do
    @order.add_item(params[:product])
    redirect '/'
  end

  post '/customer_update' do
    @order.add_customer(params[:customer]) if params[:customer]
    redirect '/'
  end

  get '/table_number_update' do
    erb :"/../views/index"
  end

  post '/table_number_update' do
    @order.table_number = params[:table_number]
    body json table_number: @order.table_number
  end

  get '/generate_receipt' do
    erb :"/../views/index"
  end

  post '/generate_receipt' do
    cash = params[:cash_given].to_f.round(2)
    if @calculator.calculate_change(cash) < 0
      @warning = 'Not enough cash given'
    else
      define_receipt
      reset_order
    end
    erb :"/../views/index"
  end

  delete '/clear_order' do
    reset_order
    redirect '/'
  end

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  run! if app_file == $PROGRAM_NAME
end
