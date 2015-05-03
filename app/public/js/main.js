$( document ).ready( function() {
  $( '.product' ).click( function( e ) {    
    e.preventDefault();
    text = $( this ).text();
    
    $.post( '/', { product: text }, function( response ){
      console.log(response)
      var arr = response.order.line_order
      var total = response.order.total
      var table_number = response.order.table_number
      var customers = response.order.customers
      var tax_percentage = response.order.tax_percentage
      var tax_applied = response.order.tax_applied
      var li = "<li>";
      $("ul.dynamic-ul").empty();
      for(var i in arr) {
        $("ul#dynamic-list").append(li.concat(arr[i].item + ' ' + arr[i].number + ' x ' + arr[i].item_price ));
      }
      $("ul#dynamic-costs-list").append(li.concat('Tax percentage: ' + tax_percentage + '%'))
      $("ul#dynamic-costs-list").append(li.concat('Table number: ' + table_number))
      $("ul#dynamic-costs-list").append(li.concat('Customer(s): ' + customers))
      $("ul#dynamic-costs-list").append(li.concat('Pre-tax total: £' + total))
      $("ul#dynamic-costs-list").append(li.concat('Total due: £' + tax_applied))
    });
  });
});

