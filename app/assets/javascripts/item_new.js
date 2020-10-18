$(function(){

  // プレビューの表示
  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <div class="preview-box__upper-box">
                    <img src="" alt="preview" width="114" height="80" >
                  </div>
                  <div class="preview-box__lower-box">
                    <div class="preview-box__lower-box__update-box">
                      <label class="edit_btn">編集</label>
                    </div>
                    <div class="preview-box__lower-box__delete-box" id="delete_btn_${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }

  // 画像投稿フォルダの追加
  function buildInputImage(index) {
    var inputImage = `<input class="hidden-field" type="file" 
                      name="item[images_attributes][${index}][image]"
                      id="item_images_attributes_${index}_image">`
    return inputImage;
  }

  // ラベル幅調整
  function setLabel() {
    //プレビューボックスのwidthを取得し、初期サイズ（620px）から引くことでラベルwidth決定
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }

  // 画像が１つ以上あるか確認
  function checkImage() {
    // プレビューに画像があるか確認
    var imagecount = $('.preview-box').length;
    // 画像がない場合→送信ボタンの効力無効
    if (imagecount == 0) {
      $('.form__main__content__send-boxes__send-btn').prop("disabled", true);
      $('.form__main__content__send-boxes__send-btn').css('background-color','#808080');
    } else {
      $('.form__main__content__send-boxes__send-btn').prop("disabled", false);
      $('.form__main__content__send-boxes__send-btn').css('background-color','');
    }
  }
  // 投稿編集時
    //items/:i/editページへリンクした際のアクション=======================================
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      //プレビューにidを追加
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.preview-box__lower-box__delete-box-hidden').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      //プレビューが5あるときは、投稿ボックスを消しておく
      if (count == 5) {
        $('.label-content').hide();
      }
      // 手数料再表示
      let tax = $('#item_price').val();
      $('.form__main__content__settlement__commission-box__money01').text(Math.ceil(tax * 0.1) + "円");
      $('.form__main__content__settlement__commission-box__money02').text(Math.ceil(tax - (tax * 0.1)) + "円");
      // 画像が１つ以上あるか確認
      checkImage();
    }
    //=============================================================================

  // はじめに画像が１つ以上あるか確認
  checkImage();
  
  // プレビューの追加
  $(document).on('change', '.hidden-field', function() {
    // ラベル幅調整
    setLabel();
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');

    // preview-boxのid振り直し
    $(function(){
      $('.preview-box').attr('id', function(i) {
        return 'preview-box__' + i;
        i++;
      });
    });

    // hidden-fieldのid振り直し
    $(function(){
      $('.hidden-field').attr('id', function(i) {
        return 'item_images_attributes_' + i + '_image';
        i++;
      });
    });

    // hidden-fieldのname振り直し
    $(function(){
      $('.hidden-field').attr('name', function(i) {
        return 'item[images_attributes][' + i + '][image]';
        i++;
      });
    });

    // 削除ボタンのid振り直し
    $(function(){
      $('.preview-box__lower-box__delete-box').attr('id', function(i) {
        return 'delete_btn_' + i;
        i++;
      });
    });

    //labelボックスのidとforを更新
    $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
    //選択したfileのオブジェクトを取得
    var file = this.files[0];
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      var image = this.result;
      //プレビューが元々なかった場合はhtmlを追加
      if ($(`#preview-box__${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(id);
        //ラベルの直前のプレビュー群にプレビューを追加
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);

        // 画像投稿投稿フォルダを追加する
        var hiddenCount = $('.hidden-field').length;
        if (hiddenCount < 6) {
          $('.hidden-content').append(buildInputImage(hiddenCount));
        }
      
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.label-content').hide();
        }
        
        //編集時の動作 プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す
        if ($(`#item_images_attributes_${id}__destroy`).length != 0) {
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        }

        // ラベル幅調整
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          //プレビューの数でラベルのオプションを更新する
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    // 画像が１つ以上あるか確認
    checkImage();
    };
  });

  // 新しく投稿した画像削除時の動作
  $(document).on('click', '.preview-box__lower-box__delete-box', function() {
    //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
    var id = $(this).attr('id').replace(/[^0-9]/g, '');

    //取得したidに該当するプレビューを削除
    $(`#preview-box__${id}`).remove();

    //フォームを削除 
    $(`#item_images_attributes_${id}_image`).remove();

    // preview-boxのid振り直し
    $(function(){
      $('.preview-box').attr('id', function(i) {
        return 'preview-box__' + i;
        i++;
      });
    });

    // hidden-fieldのid振り直し
    $(function(){
      $('.hidden-field').attr('id', function(i) {
        return 'item_images_attributes_' + i + '_image';
        i++;
      });
    });

    // hidden-fieldのname振り直し
    $(function(){
      $('.hidden-field').attr('name', function(i) {
        return 'item[images_attributes][' + i + '][image]';
        i++;
      });
    });

    // 削除ボタンのid振り直し
    $(function(){
      $('.preview-box__lower-box__delete-box').attr('id', function(i) {
        return 'delete_btn_' + i;
        i++;
      });
    });

    //削除時のラベル操作
    var count = $('.preview-box').length;
    $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
    
    //5個めが消されたらラベルを表示
    if (count == 4) {
      $('.label-content').show();
    }
    // ラベル幅調整
    setLabel(count);
    // 画像が１つ以上あるか確認
    checkImage();
  });

  // 編集時元々あった画像削除時の動作
  $(document).on('click', '.preview-box__lower-box__delete-box-hidden', function() {
    // item_images_attributes_${id}_image から${id}に入った数字のみを抽出
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    
    // 投稿編集時
    if ($(`#item_images_attributes_${id}__destroy`).length != 0) {
      $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
    }

    // 取得したidに該当するプレビューを削除
    $(`#preview-box__${id}`).remove();

    // フォームの値をクリア（削除はしない）
    $(`#item_images_attributes_${id}_image`).val("");

    //削除時のラベル操作
    var count = $('.preview-box').length;
    $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
    
    //5個めが消されたらラベルを表示
    if (count == 4) {
      $('.label-content').show();
    }
    // ラベル幅調整
    setLabel(count);
    // 画像が１つ以上あるか確認
    checkImage();
  });
});