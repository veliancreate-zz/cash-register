Receipt = function(order){
  this.total = 'Pre-tax total: £' + order.total;
  this.taxApplied = 'Total due: £' + order.tax_applied;
  this.taxPercentage = 'Tax percentage: ' + order.tax_percentage + '%';
}