
// $(function() {

//  $(document).on('click', '.image_upload', function(){
//    //inputの要素はクリックされておらず、inputの親要素であるdivが押されている。
//    //だからdivのクラス名をclickした時にイベントが作動。
//    //div（this）から要素を辿ればinputを指定することが可能。

//    //$liに追加するためのプレビュー画面のHTML。横長でないとバグる
//    var preview = $('<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_edit">編集</div><div class="image-preview_btn_delete">削除</div></div>'); 
//    //次の画像を読み込むためのinput。 
//    var append_input = $(`<li class='input'><label class="upload-label"><div class="Contents__image__upload"><i class="fa fa-camera"></i><input class="hidden image_upload" type="file"> </div></div></div></label></li>`)
//    $ul = $('#previews')
//    $li = $(this).parents('li');
//    $label = $(this).parents('.upload-label');
//    $inputs = $ul.find('.image_upload');
//    //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
//    $('.image_upload').on('change', function (e) {
//      //inputで選択した画像を読み込む
//      var reader = new FileReader();


//      // プレビューに追加させるために、inputから画像ファイルを読み込む。
//      reader.readAsDataURL(e.target.files[0]);

//      //画像ファイルが読み込んだら、処理が実行される。 
//      reader.onload = function(e){
//        //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
//        // つまり、<img>タグに画像を追加させる
//        $(preview).find('.preview').attr('src', e.target.result);
//      }

//      //inputの画像を付与した,previewを$liに追加。
//      $li.append(preview)
//      $('#previews').css('display', 'flex');

//      //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
//      $label.css('display','none'); // inputを非表示
//      $li.removeClass('input');     // inputのクラスはjQueryで数を数える時に邪魔なので除去
//      $li.addClass('image-preview'); // inputのクラスからプレビュー用のクラスに変更した
//      $lis = $ul.find('.image-preview'); // クラス変更が完了したところで、プレビューの数を数える。 
//      $('#previews li').css({
//        'width': `114px`,
//      })




//      //"ul"に新しい"li(inputボタン)"を追加させる。
//      if($lis.length <= 4 ){
//        $ul.append(append_input)
//        $('#previews li:last-child').css({
//          'width': `calc(100% - (20% * ${$lis.length}))`
//        })
//      }
//      else if($lis.length == 5 ){
//        $li.addClass('image-preview');
//        $ul.append(append_input)
//        $('#previews li:last-child').css({
//          'width': `100%`
//        })
//      }
//      // ９個のプレビューのとき、1個のinputを追加。最後の数は9です。
//      else if($lis.length <= 9 ){
//        $li.addClass('image-preview');
//        $ul.append(append_input)
//        $('#previews li:last-child').css({
//          'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
//        })
//      }

//      //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
//      // これをしないと、それぞれのinputの区別ができず、最後の1枚しかDBに保存されません。
//      // 全部のプレビューの番号を更新することで、プレビューを削除して、新しく追加しても番号が1,2,3,4,5,6と綺麗に揃う。だから全部の番号を更新させる
//      $inputs.each( function( num, input ){
//        //nameの番号を更新するために、現在の番号を除去
//        $(input).removeAttr('name');
//        $(input).attr({
//          name:"item[images_attributes][" + num + "][picture]",
//          id:"item_images_attributes_" + num + "_picture"
//        });
//      });
//    })
//  })

//  $(document).on('click','.image-preview_btn_delete',function(){
//   var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)
//   $lis = $ul.find('.image-preview');
//   $input = $ul.find('.input');
//   $ul = $('#previews')
//   $li = $(this).parents('.image-preview');


//   //"li"ごと削除して、previewとinputを削除させる。
//   $li.remove();

//   // inputボタンのサイズを更新する、または追加させる
//   // まずはプレビューの数を数える。
//   $lis = $ul.find('.image-preview');
//   $label = $ul.find('.input');
//   if($lis.length <= 4 ){
//     // inputのサイズを変更
//     $('#previews li:last-child').css({
//       'width': `calc(100% - (20% * ${$lis.length}))`
//     })
//   }
//   else if($lis.length == 5 ){
//     // inputのサイズを変更
//     $('#previews li:last-child').css({
//       'width': `100%`
//     })
//   }
//   else if($lis.length < 9 ){
//     // inputのサイズを変更
//     $('#previews li:last-child').css({
//       'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
//     })
//   }
//   else if($lis.length == 9 ){
//     $ul.append(append_input) // 9個の時だけ、新しいinputを追加してやる
//     $('#previews li:last-child').css({
//       'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
//     })
//   }
// 　});
// });
=======
$(function(){
  var dataBox = new DataTransfer();
  var dropArea = document.getElementById("#image-box-1");
  var file_field = document.querySelector('input[type=file]')

  // window.onload = function(e){
  //   //ドラッグした要素がドロップターゲットの上にある時にイベントが発火
  //   dropArea.addEventListener("dragover", function(e){
  //     e.preventDefault();
  //     //ドロップエリアに影がつく
  //     $(this).children('#image-box__container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
  //   },false);
  //   //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
  //   dropArea.addEventListener("dragleave", function(e){
  //     e.preventDefault();
  //   //ドロップエリアの影が消える
  //     $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
  //   },false);
  //   //ドラッグした要素をドロップした時に発火するイベント
  //   dropArea.addEventListener("drop", function(e) {
  //     e.preventDefault();
  //     $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
  //     var files = e.dataTransfer.files;
  //     //ドラッグアンドドロップで取得したデータについて、プレビューを表示
  //     $.each(files, function(i,file){
  //       //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
  //       var fileReader = new FileReader();
  //       //dataTransferオブジェクトに値を追加
  //       dataBox.items.add(file)
  //       file_field.files = dataBox.files
  //       //lengthで要素の数を取得
  //       var num = $('.item-image').length + i + 1
  //       //指定されたファイルを読み込む
  //       fileReader.readAsDataURL(file);
  //       // 10枚プレビューを出したらドロップボックスが消える
  //       if (num==10){
  //         $('#image-box__container').css('display', 'none')   
  //       }
  //       //image fileがロードされた時に発火するイベント
  //       fileReader.onload = function() {
  //         //変数srcにresultで取得したfileの内容を代入
  //         var src = fileReader.result
  //         var html =
  //         `<div class='item-image' data-image='${file.name}'>
  //           <div class=' item-image__content'>
  //             <div class='item-image__content--icon'>
  //               <img src=${src} width="80" height="80" >
  //             </div>
  //           </div>
  //           <div class='item-image__operetion'>
  //             <div class='item-image__operetion--delete'>削除</div>
  //           </div>
  //         </div>`
  //       //image-box__containerの前にhtmlオブジェクトを追加　
  //       $('#image-box__container').before(html);
  //       };
  //       //image-box__containerにitem-num-(変数)という名前のクラスを追加する
  //       $('#image-box__container').attr('class', `item-num-${num}`)
  //     })
  //   })
  // }
  
  $('.img').change(function(){

    var file = $('input[type="file"]').prop('files')[0];
 
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      var num = $('.item-image').length + 1 + i

      dataBox.items.add(file)
      file_field.files = dataBox.files

      fileReader.readAsDataURL(file);

      if (num == 10){
        $('#image-box__container').css('display', 'none')
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
    
        $('#image-box__container').before(html);
      };

      $('#image-box__container').attr('class', `item-num-${num}`)
     
    
    });
  });
     
  $(document).on("click", '.item-image__operetion--delete', function(){

    var target_image = $(this).parent().parent()

    target_image.remove();

    file_field.val("")
  })
});
