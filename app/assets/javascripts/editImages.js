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
 
 $('.img').change(function(){

   var file = $('input[type="file"]').prop('files')[0];

   $.each(this.files, function(i, file){
     var fileReader = new FileReader();
     var num = $('.item-image').length + 1 + i

     dataBox.items.add(file)
     file_field.files = dataBox.files

     fileReader.readAsDataURL(file);

     if (num == 10){
       $('#image-box__container__edit').css('display', 'none')
     }
     fileReader.onloadend = function() {
       var src = fileReader.result
       var html= 
       `<div class=' item-image' data-image='${file.name}'>
         <div class=' item-image__content'>
           <div class='item-image__content--icon'>
             <img src="${src}" width="80" height="80">
           </div>
         </div>
         <div class='item-image__operetion'>
           <div class='item-image__operetion--delete'>削除</div>
         </div>
       </div>`
   
       $('#image-box__container__edit').before(html);
     };

     $('#image-box__container__edit').attr('class', `item-num-${num}`)
    
   
   });
 });
    
 $(document).on("click", '.item-image__operetion--delete', function(){

   var target_image = $(this).parent().parent()

   target_image.remove();

   file_field.val("")
 })
});



