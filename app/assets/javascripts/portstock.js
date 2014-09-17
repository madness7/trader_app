$(function() {
    
    $('#portstock_portfolio_id').on('change', function(){
     var currentBalance = parseFloat($('#portstock_portfolio_balance').val());

    //if (!isNaN(currentBalance)){
       // console.log("hello World");
        $('#portfolio_balance').text(currentBalance);
    //}
    })
    
});
