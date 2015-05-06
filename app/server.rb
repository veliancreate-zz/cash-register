require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'

require_relative 'controllers/menu'
require_relative 'controllers/order'
require_relative 'controllers/receipt'

require_relative 'lib/receipt'
require_relative 'lib/order'
require_relative 'lib/calculator'

require_relative 'helpers/objects_getter'

class Till < Sinatra::Base
  register Sinatra::Partial
  enable :sessions
  enable :method_override
  set :partial_template_engine, :erb

  helpers ObjectsGetter

  RECEIPT = Receipt.new(Order)

  before '/*' do
    @receipt = RECEIPT
    objects_getter
  end

  set :views, proc { File.join(root, '..', 'views') }
  set :public_folder, proc { File.join(root, '..', '..', 'public') }

  run! if app_file == $PROGRAM_NAME
end
