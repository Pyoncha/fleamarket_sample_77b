$(function(){
  $('#item_price').on('change', function(){
    let tax = $('#item_price').val();
    $('.form__main__content__settlement__commission-box__money01').text(Math.ceil(tax * 0.1) + "円");
    $('.form__main__content__settlement__commission-box__money02').text(Math.ceil(tax - (tax * 0.1)) + "円");
  });
});