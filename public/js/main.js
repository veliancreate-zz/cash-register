$( document ).ready( function() {
  $( '.product' ).click( function( e ) {    
    e.preventDefault();
    var text = $( this ).text();
    $.post( '/add_item', { product: text }, function( response ){
      window.location.replace('/');
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
