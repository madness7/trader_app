$(function() {
    
    $('#portstock_quantity').on('change', function(){
     console.log($('#portstock_quantity').val())
     console.log($('#current_price').val())
     //Get the value out of the input box - done
     //Get the value of the stock - done
     //Multiply together
     //prepend it after the yahoo-finance stuff on the page
    })
    var transaction_total = '#portstock_quantity' * '#current_price' 
});
