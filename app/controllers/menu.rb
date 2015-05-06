class Till < Sinatra::Base
  get '/' do
    erb :menu
  end
end
