$( document ).ready( function() {

  $( '.product' ).click( function( e ) {    
    e.preventDefault();
    var text = $( this ).text();
    // function productUpdate(arr, li){
    //   for(var i in arr) {
    //     $("ul#dynamic-list").append(li.concat(arr[i].item + ' ' + arr[i].number + ' x ' + arr[i].item_price ));
    //   }  
    // }
    // function receiptUpdate(receipt, li){
    //   for (var property in receipt) {
    //     if (receipt.hasOwnProperty(property)) {
    //       $("ul#dynamic-costs-list").append(li.concat(receipt[property]))    
    //     }
    //   }
    // }
    $.post( '/add_item', { product: text }, function( response ){
      window.location.replace('/');
      // $("ul.dynamic-ul").empty();
      // var li = "<li>";
      // var arr = response.order.line_order;
      // order = response.order;
      // receipt = new Receipt(order);
      // productUpdate(arr, li);
      // receiptUpdate(receipt, li);  
    });
  });

  $('select').change(function(){
    var tableNumber = $(this).val();
    $.post('/customer_update', { table_number: tableNumber });
  });

  $( '#generate-receipt' ).click( function( e ) {
    e.preventDefault();
    window.location.replace('/receipt_update');
  });
});
