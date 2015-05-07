class Till < Sinatra::Base
  get '/generate_receipt' do
    erb :receipt
  end

  post '/generate_receipt' do
    cash = params[:cash_given].to_f.round(2)
    if calculator.calculate_change(cash) < 0
      @warning = 'Not enough cash given'
    else
      define_receipt
      reset_order
    end
    erb :receipt
  end
end
