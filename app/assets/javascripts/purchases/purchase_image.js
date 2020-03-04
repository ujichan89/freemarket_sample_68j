$(function() {
  // サムネイルのサイズ
  var thumbWidth = 160;
  var thumbHeight = 100;

  // サムネイルの作成
  var insert = '';
  for (var i = 0; i < $('#purchase_image li').length; i++) {
      insert += '<a data-slide-index="' + i + '" href="#"><img src="' + $('#purchase_image li').eq(i).children('img').attr('src') + '" width="' + thumbWidth + '" height="' + thumbHeight + '" /></a>';
  };
  $('.purchases__Main__content__subImage').append(insert);

  $('#purchase_image').bxSlider({
      pagerCustom: '.purchases__Main__content__subImage',
  });
});