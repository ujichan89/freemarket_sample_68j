
$(function () {
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">                    
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][picture]"
                    id="item_images_attributes_${num}_picture"><br>             
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
                    // <label id="camera">
                    // <i class="fa fa-camera"></i>


  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }


  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
    $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else if ($('.js-file').length == 5) {
          $('#previews').append(buildImg(targetIndex, blobUrl));
    } else {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        $('#image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
=======
$(function() {
 var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)
 $ul = $('#previews')
 $lis = $ul.find('.image-preview');
 $input = $ul.find('.input');
 if($input.length == 0){
   if($lis.length <= 4 ){
     
     $ul.append(append_input)
     $lis.before(append_input)
     $('.input-area').css({
       'width': `calc(100% - (20% * ${$lis.length}))`
     })
   }
   else if($lis.length == 5 ){
     $ul.append(append_input)
     $('#previews .input').css({   
       'width': `100%`
       
     })
   }
   else if($lis.length <= 9 ){
     $ul.append(append_input)
     $('#previews .input').css({
       'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
     })
   }
 }

 $(document).on('click','.image-preview_btn_delete',function(){
   var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)
   $ul = $('#previews')
   $lis = $ul.find('.image-preview');
   $input = $ul.find('.input');
   $ul = $('#previews')
   $li = $(this).parents('.image-preview');
 
 
   //"li"ごと削除して、previewとinputを削除させる。
   $li.remove();
 
   // inputボタンのサイズを更新する、または追加させる
   // まずはプレビューの数を数える。
   $lis = $ul.find('.image-preview');
   $label = $ul.find('.input');
   if($lis.length <= 4 ){
     // inputのサイズを変更
     $('#previews li:last-child').css({
       'width': `calc(100% - (20% * ${$lis.length}))`
     })
   }
   else if($lis.length == 5 ){
     // inputのサイズを変更
     $('#previews li:last-child').css({
       'width': `100%`
     })
   }
   else if($lis.length < 9 ){
     // inputのサイズを変更
     $('#previews li:last-child').css({
       'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
     })
   }
   else if($lis.length == 9 ){
     $ul.append(append_input) // 9個の時だけ、新しいinputを追加してやる
     $('#previews li:last-child').css({
       'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
     })
   }
 });
})

