Receipt = function(order){
  this.tableNumber = 'Table number: ' + order.table_number;
  this.customers = "Customer(s): " + order.customers;
  this.total = 'Pre-tax total: £' + order.total;
  this.taxApplied = 'Total due: £' + order.tax_applied;
  this.taxPercentage = 'Tax percentage: ' + order.tax_percentage + '%';
}