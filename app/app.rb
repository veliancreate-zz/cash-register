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

  get '/' do
    @receipt = RECEIPT
    objects_getter
    erb :"/../views/index"
  end

  post '/' do
    @receipt = RECEIPT
    objects_getter
    @receipt.order.add_item(params[:product])
    products = @receipt.order.line_order
    body json(products: products)
  end

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, 'public') }

  run! if app_file == $PROGRAM_NAME
end
