require 'sinatra/base'
require 'sinatra/partial'
require_relative 'controllers/app'

class Till < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"/../views/index"
  end

  set :views, proc { File.join(root, 'views') }

  run! if app_file == $PROGRAM_NAME
end
