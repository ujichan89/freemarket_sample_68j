$(function(){


  $("#token_submit").on("click", function(){
    if( document . inputForm . number . value == "" ){
        document . getElementById( 'warn1' ) . style . display = "block";
    }else{
        document . getElementById( 'warn1' ) . style . display = "none";
    }
    });
    $("#token_submit").on("click", function(){
      if( document . inputForm . number . value == "" ){
          document . getElementById( 'warn2' ) . style . display = "block";
      }else{
          document . getElementById( 'warn2' ) . style . display = "none";
      }
    });
    $("#token_submit").on("click", function(){
      if( document . inputForm . number . value == "" ){
          document . getElementById( 'warn3' ) . style . display = "block";
      }else{
          document . getElementById( 'warn3' ) . style . display = "none";
      }
    });
  });