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

  // file番号の定義
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // プレビューの追加
  $(document).on('change', '.hidden-field', function() {
    setLabel();
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
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

        $('.hidden-content').append(buildInputImage(fileIndex[0]));
        fileIndex.shift();


      }
      //イメージを追加
      $(`#preview-box__${id} img`).attr('src', `${image}`);
      var count = $('.preview-box').length;
      //プレビューが10個あったらラベルを隠す 
      if (count == 10) { 
        $('.label-content').hide();
      }

      //ラベルのwidth操作
      setLabel();
      //ラベルのidとforの値を変更
      if(count < 10){
        //プレビューの数でラベルのオプションを更新する
        $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
      }
    }
  });

  // 画像の削除
  $(document).on('click', '.preview-box__lower-box__delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    //取得したidに該当するプレビューを削除
    $(`#preview-box__${id}`).remove();
    //フォームの中身を削除 
    $(`#item_images_attributes_${id}_image`).val("");

    //削除時のラベル操作
    var count = $('.preview-box').length;
    //5個めが消されたらラベルを表示
    if (count == 4) {
      $('.label-content').show();
    }
    setLabel(count);

    if(id < 5){
      //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
    }
  });
});