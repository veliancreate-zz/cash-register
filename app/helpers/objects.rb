module ObjectsGetter
  def objects_getter
    @order = @receipt.order
    @order.calculator = Calculator
    @menu = @order.items_getter.sort
    @receipt_list = @receipt.read_json
  end
end
