require 'sinatra/base'

class Till < Sinatra::Base
  enable :sessions

  set :views, proc { File.join(root, 'views') }

  run! if app_file == $PROGRAM_NAME
end
