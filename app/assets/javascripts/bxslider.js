$(function() {
  // サムネイルのサイズ
  var thumbWidth = 160;
  var thumbHeight = 100;

  // サムネイルの作成
  var insert = '';
  for (var i = 0; i < $('#sample li').length; i++) {
      insert += '<a data-slide-index="' + i + '" href="#"><img src="' + $('#sample li').eq(i).children('img').attr('src') + '" width="' + thumbWidth + '" height="' + thumbHeight + '" /></a>';
  };
  $('.custom-thumb').append(insert);

  $('#sample').bxSlider({
      pagerCustom: '.custom-thumb',
  });
});