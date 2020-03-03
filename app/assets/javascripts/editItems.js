$(function(){
 $('#price_calc__edit').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
   var data = $('#price_calc__edit').val(); // val()でフォームのvalueを取得(数値)
   var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
   var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
   $('.EditContents__price__right__commission--rod').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
   $('.EditContents__price__right__commission--rod').prepend('¥') // 手数料の前に¥マークを付けたいので
   $('.EditContents__price__right__profit--rod').html(profit)
   $('.EditContents__price__right__profit--rod').prepend('¥')
   $('#price__edit').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
   if(profit == '') {   // もし､計算結果が''なら表示も消す｡
   $('.EditContents__price__right__profit--rod').html('');
   $('.EditContents__price__right__commission--rod').html('');
   }
 });
 $("select").on("mouseover", function(){
   $(this).css("border-color", "deepskyblue");
 }).on("mouseout", function(){
   $(this).css("border-color", "#dbdbe0");
 });
 
 $("input").on("mouseover", function(){
   $(this).css("border-color", "deepskyblue");
 }).on("mouseout", function(){
   $(this).css("border-color", "#dbdbe0");
 });
 $("textarea").on("mouseover", function(){
   $(this).css("border-color", "deepskyblue");
 }).on("mouseout", function(){
   $(this).css("border-color", "#dbdbe0");
 });
});
