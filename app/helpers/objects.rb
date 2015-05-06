module ObjectsGetter
  def objects_getter
    @order = @receipt.order
    @order.calculator = Calculator
    @calculator = @order.calculator
    @menu = @order.items_getter.sort
    @receipt_list = @receipt.read_json
  end

  def define_receipt
    @receipt_list = @receipt.read_json
    @receipt_order = @receipt_list['order']
    @receipt_totals = @receipt_list['order']['calculator']
  end

  def reset_order
    @receipt.reset_order(Order)
    @order = @receipt.order
    @order.calculator = Calculator
  end
end
