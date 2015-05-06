class Till < Sinatra::Base
  get '/order' do
    erb :order
  end

  post '/add_item' do
    @order.add_item(params[:product])
    redirect '/order'
  end

  get '/table_number_update' do
    erb :order
  end

  post '/table_number_update' do
    @order.table_number = params[:table_number]
    body json table_number: @order.table_number
  end

  post '/customer_update' do
    @order.add_customer(params[:customer]) if params[:customer]
    redirect '/order'
  end

  delete '/clear_order' do
    reset_order
    redirect '/order'
  end
end
