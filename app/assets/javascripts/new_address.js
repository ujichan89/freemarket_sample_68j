
// //新規登録時  例外処理

// $(function(){
//   $("#AddressInput__btn").on('click',function(e){
//     e.preventDefault();                      //エラー文消さない
//     if(input_check()){                        //
//       return false;                           //親要素のイベントを発生させない
//     }
//   });
// });

// // 入力内容チェックのための関数
// function input_check(){
//   let result = true;

//   // エラー用装飾のためのクラスリセット
//   $('#family_name_address').removeClass("inp_error");
//   $('#first_name_address').removeClass("inp_error");
//   $('#family_furigana_address').removeClass("inp_error");
//   $('#first_furigana_address').removeClass("inp_error");
//   $('#number').removeClass("inp_error");
//   $('#prefecture').removeClass("inp_error");
//   $('#municipality').removeClass("inp_error");
//   $('#street').removeClass("inp_error");


//   // 入力エラー文をリセット
//   $("#Input_error__family_name_address").empty();
//   $("#Input_error__first_name_address").empty();
//   $("#Input_error__family_furigana_address").empty();
//   $("#Input_error__first_furigana_address").empty();
//   $("#Input_error__number").empty();
//   $("#Input_error__prefecture").empty();
//   $("#Input_error__municipality").empty();
//   $("#Input_error__street").empty();

//   // 入力内容セット
//   let family_name_address           =$('#family_name_address').val();
//   let first_name_address            =$('#first_name_address').val();
//   let family_furigana_address       =$('#family_furigana_address').val();
//   let first_furigana_address        =$('#first_furigana_address').val();
//   let number                        =$('#number').val();
//   let prefecture                    =$('#prefecture').val();
//   let municipality                  =$('#municipality').val();
//   let street                        =$('#street').val();

//   // 入力内容チェック

//   //苗字
//   if(family_name_address == ""){
//     $("#Input_error__family_name_address").html("苗字を入力してください");
//     $("#family_name_address").addClass("inp_error");
//     result = false;
//    }

//    //名前
//    if(first_name_address == ""){
//     $("#Input_error__first_name_address").html("名前を入力してください");
//     $("#family_name_address").addClass("inp_error");
//     result = false;
//    }
 
//    //苗字(カナ)
//    if(family_furigana_address == ""){
//     $("#Input_error__family_furigana_address").html("苗字カナを入力してください");
//     $("#family_furigana_address").addClass("inp_error");
//     result = false;
//    }
 
//    //苗字(カナ)
//    if(first_furigana_address == ""){
//     $("#Input_error__first_furigana_address").html("名前カナを入力してください");
//     $("#namemeikana_address").addClass("inp_error");
//     result = false;
//    }

//   // 郵便番号
//   if(number == ""){
//    $("#Input_error__number").html("郵便番号を入力してください");
//    $("#number").addClass("inp_error");
//    result = false;
//   }else if(number.length < 6 || password.length > 8 ){
//    $("##Input_error__password").html(" 郵便番号を入力してください。");
//    $("#password").addClass("inp_error");
//    result = false;
//   }

//   //都道府県
//   if(prefecture == ""){
//    $("#Input_error__prefecture").html("都道府県を入力してください");
//    $("#prefecture").addClass("inp_error");
//    result = false;
//   }

//   //市町村区
//   if(municipality == ""){
//    $("#Input_error__municipality").html("市町村区を入力してください");
//    $("#municipality").addClass("inp_error");
//    result = false;
//   }

//   //番地
//   if(street == ""){
//    $("#Input_error__street").html("番地を入力してください");
//    $("#street").addClass("inp_error");
//    result = false;
//   }

//   return result;
// }