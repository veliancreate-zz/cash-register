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

  before '/' do
    @receipt = RECEIPT
    objects_getter
  end

  get '/' do
    erb :"/../views/index"
  end

  post '/' do
    @receipt.order.add_item(params[:product])
    order = @receipt.order
    body json(order: order.to_json)
  end

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, 'public') }

  run! if app_file == $PROGRAM_NAME
end
