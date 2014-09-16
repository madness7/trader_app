$(function() {
    
    $('#portstock_quantity').on('change', function(){
     var quantity = parseInt($('#portstock_quantity').val());
     var currentPrice = parseFloat($('#current_price').val());

    if (!isNaN(quantity) && !isNaN(currentPrice)){
        console.log("hello World");
        var transaction_total = quantity * currentPrice;
        $("#transaction_total").text(transaction_total);
    }
    })
    
});
