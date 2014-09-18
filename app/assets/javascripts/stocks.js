// shows the potential transaction value.

$(function() {
    
    $('#portstock_quantity').on('change', function(){
     var quantity = parseInt($('#portstock_quantity').val());
     var currentPrice = parseFloat($('#portstock_price_paid').val());

    if (!isNaN(quantity) && !isNaN(currentPrice)){
        console.log("hello World");
        var transaction_total = (quantity * currentPrice).toFixed(2);
        $("#transaction_total").text(transaction_total);
    }
    })
    
});
