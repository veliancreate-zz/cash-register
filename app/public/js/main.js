$( document ).ready( function() {
  $( '.product' ).click( function( e ) {    
    e.preventDefault();
    text = $( this ).text();
    $.post( '/', { product: text }, function( response ){
      arr = response.products
      $("ul#dynamic-list").empty();
      for(var i in arr) {
        var li = "<li>";
        $("ul#dynamic-list").append(li.concat(arr[i].item), li.concat(arr[i].number));
      }
    });
  });
});

