
//新規登録時  例外処理

$(function(){
  $("#UserInput__btn").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(input_check()){                        //
      return false;                           //親要素のイベントを発生させない
    }
  });
});

// 入力内容チェックのための関数
function input_check(){
  let result = true;

  // エラー用装飾のためのクラスリセット
  $('#nickname').removeClass("inp_error");
  $('#email').removeClass("inp_error");
  $('#password').removeClass("inp_error");
  $('#password2').removeClass("inp_error");
  $('#family_name').removeClass("inp_error");
  $('#first_name').removeClass("inp_error");
  $('#family_furigana').removeClass("inp_error");
  $('#first_furigana').removeClass("inp_error");
  $('.birthday_year').removeClass("inp_error");
  $('.birthday_month').removeClass("inp_error");
  $('.birthday_day').removeClass("inp_error");


  // 入力エラー文をリセット
  $("#Input_error__name").empty();
  $("#Input_error__email").empty();
  $("#Input_error__password").empty();
  $("#Input_error__password2").empty();
  $("#Input_error__family_name").empty();
  $("#Input_error__first_name").empty();
  $("#Input_error__family_furigana").empty();
  $("#Input_error__first_furigana").empty();
  $("#Input_error__birthday__select").empty();



  // 入力内容セット
  let nickname         =$('#nickname').val();
  let email            =$('#email').val();
  let password         =$('#password').val();
  let password2        =$('#password2').val();
  let family_name      =$('#family_name').val();
  let first_name       =$('#first_name').val();
  let family_furigana  =$('#family_furigana').val();
  let first_furigana   =$('#first_furigana').val();
  let birthday_year    =$('.birthday_year').val();
  // let birthday_month   =$('#birthday_month').val();
  // let birthday_day     =$('#birthday_day').val();
  


  // 入力内容チェック

  //ニックネーム
  if(nickname == ""){
    $("#Input_error__name").html(" ニックネームを入力してください");
    $("#nickname").addClass("inp_error");
    result = false;
  }

  //メールアドレス登録
  if(email == ""){
    $("#Input_error__email").html("メールアドレスを入力してください")
    $(email).addClass("inp_error");
    result = false;
  }else if(!email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
    $("#Input_error__email").html("フォーマットが不適切です");
    $("#email").addClass("inp_error");
    result = false;
  }

  // パスワード
  if(password == ""){
   $("#Input_error__password").html(" パスワードを入力してください");
   $("#password").addClass("inp_error");
   result = false;
  }else if(password.length < 7 || password.length > 128 ){
   $("##Input_error__password").html(" パスワードは7文字以上 128文字以下で入力してください。");
   $("#password").addClass("inp_error");
   result = false;
  }

  // パスワード2
  if(password2 == ""){
    $("#Input_error__password2").html(" パスワードを入力してください");
    $("#password2").addClass("inp_error");
    result = false;
   }else if(password.length < 7 || password.length > 128 ){
    $("##Input_error__password2").html(" パスワードは7文字以上 128文字以下で入力してください。");
    $("#password2").addClass("inp_error");
    result = false;
   }

  //苗字
  if(family_name == ""){
   $("#Input_error__family_name").html("苗字を入力してください");
   $("#family_name").addClass("inp_error");
   result = false;
  }

  //名前
  if(first_name == ""){
   $("#Input_error__first_name").html("名前を入力してください");
   $("#family_name").addClass("inp_error");
   result = false;
  }

  //苗字(カナ)
  if(family_furigana == ""){
   $("#Input_error__family_furigana").html("苗字カナを入力してください");
   $("#family_furigana").addClass("inp_error");
   result = false;
  }

  //苗字(カナ)
  if(first_furigana == ""){
   $("#Input_error__first_furigana").html("名前カナを入力してください");
   $("#namemeikana").addClass("inp_error");
   result = false;
  }

  //生年月日 日
   if(birthday_year == ""){
    $("#Input_error__birthday__select").html("生年月日を入力してください");
    // $("#birthday_year").addClass("inp_error");
    // $("#birthday_month").addClass("inp_error");
    // $("#birthday_day").addClass("inp_error");
    result = false;
   }

  //生年月日 日
  if(birthday_year == ""){
    $("#Input_error__birthday__select").html("生年月日を入力してください");
    result = false;
   }
  return result;
}

