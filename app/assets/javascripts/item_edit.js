//item__edit

$(function(){

  // 入力内容チェックのための関数
function input_check(){
  let result = true;

  // エラー用装飾のためのクラスリセット
  $('#item_images_attributes_0_picture__edit').removeClass("inp_error");
  $('#item_name__edit').removeClass("inp_error");
  $('#item_description__edit').removeClass("inp_error");
  $('#parent_form__edit').removeClass("inp_error");
  $('#item_id__edit').removeClass("inp_error");
  $('#item_charge__edit').removeClass("inp_error");
  $('#item_area__edit').removeClass("inp_error");
  $('#item_day__eidt').removeClass("inp_error");
  $('#price_calc__edit').removeClass("inp_error");


  // 入力エラー文をリセット
  $("#Input_error__edit__image").empty();
  $("#Input_error__edit__itemname").empty();
  $("#Input_error__edit__description").empty();
  $("#Input_error__edit__category").empty();
  $("#Input_error__edit__status").empty();
  $("#Input_error__edit__charge").empty();
  $("#Input_error__edit__area").empty();
  $("#Input_error__edit__day").empty();
  $("#Input_error__edit__price").empty();

  // 入力内容セット

  let item_images_attributes_0_picture__edit   =$('#item_images_attributes_0_picture__edit').val();
  let item_name__edit                          =$('#item_name__edit').val();
  let item_description__edit                   =$('#item_description__edit').val();
  let parent_form__edit                        =$('#parent_form__edit').val();
  let item_id__edit                            =$('#item_id__edit').val();
  let item_charge__edit                       =$('#item_charge__edit').val();
  let item_area__edit                          =$('#item_area__edit').val();
  let item_day__edit                           =$('#item_day__edit').val();
  let price_calc__edit                         =$('#price_calc__edit').val();


  // 入力内容チェック

  //画像
  if(item_images_attributes_0_picture__edit == ""){
   $("#Input_error__edit__image").html("画像を入力してください");
   $("#item_images_attributes_0_picture__eidt").addClass("inp_error");
   result = false;
  }
  //商品名
  if(item_name__edit == ""){
    $("#Input_error__edit__itemname").html(" 商品名を入力してください");
    $("#item_name__edit").addClass("inp_error");
    result = false;
  }


    //商品の説明
  if(item_description__edit == ""){
   $("#Input_error__edit__description").html("商品の説明を入力してください");
   $("#item_description__edit").addClass("inp_error");
   result = false;
  }
  //カテゴリー
  if(parent_form__edit == ""){
    $("#Input_error__edit__category").html("カテゴリーを入力してください");
    $("#parent_form__edit").addClass("inp_error");
    result = false;
   }

  //商品の状態
  if(item_id__edit == ""){
    $("#Input_error__edit__status").html("商品の状態を入力してください");
    $("#item_id__edit").addClass("inp_error");
    result = false;
   }

  //発送料の負担
  if(item_charge__edit == ""){
    $("#Input_error__edit__charge").html("発送料の負担を入力してください");
    $("#item_charge__edit").addClass("inp_error");
    result = false;
   }

  //発送先の地域
  if(item_area__edit == ""){
    $("#Input_error__edit__area").html("発送先の地域を入力してください");
    $("#item_area__edit").addClass("inp_error");
    result = false;
   }

  //発送までの日数
  if(item_day__edit == ""){
    $("#Input_error__edit__day").html("発送までの日数を入力してください");
    $("#item_day__edit").addClass("inp_error");
    result = false;
   }

  //価格
  if(price_calc__edit == ""){
    $("#Input_error__edit__price").html("価格を入力してください");
    $("#price_calc__edit").addClass("inp_error");
    result = false;
   }
   return result;
}


  $("#ItemInput__edit__btn").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(input_check()){                      //この中にsubmitアクションを作る

      $('.form').submit();
      // console.log($('.form').attr('action', '/items'));
      // $('.form').attr('action', '/items/8').submit();
      return false;                           //親要素のイベントを発生させない
    }
  });
});


// ②[:id]の代わりに今編集しているitemのidを入れる
//  $('.form').attr('action', '/items/<今編集しているitemのid>').submit();