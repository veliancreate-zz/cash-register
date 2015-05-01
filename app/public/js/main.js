$( document ).ready( function() {
  $( '.product' ).click( function( e ) {    
    e.preventDefault();
    text = $( this ).text();
    $.post( '/', { product: text }, function( response ){
      console.log(response.products)
    });
  });
});

