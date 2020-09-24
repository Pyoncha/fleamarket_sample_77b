$(function(){
  // 子のselectタグを追加
  function build_ChildSelect() {
    let child_select = `
                      <select name="item[category_id]" class="child_category_id">
                        <option value="">選択してください</option>
                      </select>
                      `
    return child_select;
  }

  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html = `
                      <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  // 孫のselectタグを追加
  function build_GrandChildSelect() {
    let grandchild_select = `
                            <select name="post[category_id]" class="grandchild_category_id">
                              <option value="">選択してください</option>
                            </select>
                            `
    return grandchild_select;
  }

  $("#category_form").change(function () {
    // 既存の子・孫を削除
    $(".child_category_id").remove();
    $(".grandchild_category_id").remove();

    // 選択した親の値を取得する
    let parentValue = $("#category_form").val();
    // 初期値("選択してください")以外を選択したらajaxを開始
    if (parentValue.length != 0) {
      $.ajax({
        url: '/items/category_search',
        type: 'GET',
        // itemsコントローラーにparamsをparent_idで送る
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function (data) {
        // selectタグを生成してビューにappendする
        let child_select = build_ChildSelect
        $("#category_field").append(child_select);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        data.forEach(function (children) {
          let option_html = build_Option(children)
          $(".child_category_id").append(option_html);
        })
      })
      .fail(function () {
        alert("通信エラー");
      });
    }
  });

  $(document).on("change", ".child_category_id", function () {
    // 既存の孫を削除
    $(".grandchild_category_id").remove();

    // 選択した子の値を取得する
    let childValue = $(".child_category_id").val();
    // 初期値("選択してください")以外を選択したらajaxを開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/items/category_search',
        type: 'GET',
        // postsコントローラーにparamsをchildren_idで送る
        data: { children_id: childValue },
        dataType: 'json'
      })
      .done(function (data) {
        // selectタグを生成してビューにappendする
        let grandchild_select = build_GrandChildSelect
        $("#category_field").append(grandchild_select);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        data.forEach(function (grandchild) {
          let option_html = build_Option(grandchild);
          $(".grandchild_category_id").append(option_html);
        });
      })
      .fail(function () {
        alert("grandchildで通信エラーです！");
      });
    }
  });

});