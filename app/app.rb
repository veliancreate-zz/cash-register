require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/json'
require 'json'
require_relative 'controllers/app'
require_relative 'lib/receipt'

class Till < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }

  run! if app_file == $PROGRAM_NAME
end
