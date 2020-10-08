document.addEventListener(
  'DOMContentLoaded', e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey('pk_test_17e4d5e66d3c819b054577c9');
      let submit_btn = $("#token_submit");
      submit_btn.click(function (e) {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };
        Payjp.createToken(card, function(status, response) {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.card_form.submit();
            alert("カード登録が完了しました")
          } else {
            alert("カード情報が正しくありません");
          }
        });
      });
    }
  },
  false
);