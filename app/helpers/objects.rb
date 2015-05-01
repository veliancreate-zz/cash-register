module ObjectsGetter
  def objects_getter
    @order = @receipt.order
    json = @receipt.json_object
    @shop_name = json['shopName']
    @phone = @receipt.phone_parser
    @address = json['address']
    @menu = @receipt.items_getter.sort
  end
end
