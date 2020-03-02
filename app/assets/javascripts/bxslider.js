$(function() {
  // サムネイルのサイズ
  var thumbWidth = 160;
  var thumbHeight = 100;

  // サムネイルの作成
  var insert = '';
  for (var i = 0; i < $('#slider li').length; i++) {
      insert += '<a data-slide-index="' + i + '" href="#"><img src="' + $('#slider li').eq(i).children('img').attr('src') + '" width="' + thumbWidth + '" height="' + thumbHeight + '" /></a>';
  };
  $('.GoodDetealContents__main--subImage').append(insert);

  $('#slider').bxSlider({
      pagerCustom: '.GoodDetealContents__main--subImage',
  });
});