  $(function () {
    $('.date').datetimepicker( {format: 'YYYY-MM-DD'});
    });

    $(document).on("click", ".profile_submit", function(){
      if ($(".error.img_error").text()!="") {
        return false;
      }
    });

    $(document).on("click", ".common_submit", function(){
      if(($(".error_file").text()!="") || ($(".error.img_error").text()!="")){
        return false;
      }
    });
    
    $(document).on("click",".save_comment", function( event ) {      
      id = $(this).data("id")
      $("#comment_form_"+id).validationEngine();
      if ($("#comment_body_" + id).val().trim() =="") {
        $("#comment_body_" + id).blur();
        return false;
      }
    });
    $(document).on("keyup",".submit_reply", function( e ) {
      if (e.keyCode == 13){
        id = $(this).data("id")
        $("#reply_form_"+id).validationEngine();        
        if ($("#reply_body_" + id).val().trim() =="") {          
          $("#reply_body_" + id).blur();
          e.preventDefault();
          return false;
        }
      }
    });
    $(document).on("click",".save_dislike", function( event ) {      
      id = $(this).data("id");
      $("#payment_form_"+id).validationEngine();
      if ($("#dislike_body_" + id).val().trim() =="") {
        $("#dislike_body_" + id).blur();
        return false;
      }
    });
    function showimagepreview(input) {
      extension = input.files[0].name.substring( input.files[0].name.lastIndexOf('.') + 1).toLowerCase(); 
      if ( extension == "png" || extension == "jpeg" || extension == "jpg" ) {
        $(".error.img_error").html("");
        if (input.files && input.files[0]) {

          if (input.files[0].size > 3000000) {            
            $(".error.img_error").html("File should not be larger than 3 MB");
            return false
          }
          var filerdr = new FileReader();
          filerdr.onload = function(e) {
            $(".uploadPhoto").css('background-image', 'url('+ e.target.result+')');
          
            $('#imgprvw').attr('src', e.target.result);
          
          $("#image_url").val(false);

        }
        filerdr.readAsDataURL(input.files[0]);
        $('.remove_image').show();
      }
    } else {
      $(".error.img_error").html("Please add only PNG, JPG and JPEG Images.");
      return false;
    }
    
  }
  function showfilepreview(input) {
    extension = input.files[0].name.substring( input.files[0].name.lastIndexOf('.') + 1).toLowerCase(); 
    if ( extension == "pdf" || extension == "doc" || extension == "docx" ) {
        $(".file_name").removeClass("error_file");
        $(".file_name").html("");
      if (input.files && input.files[0]) {
        if (input.files[0].size > 5000000) {
          $(".file_name").html("File should not be larger than 5 MB.").addClass("error_file");
          return false
        }
        var filerdr = new FileReader();
        var filename = input.files[0].name
        filerdr.onload = function(e) {
        $('#fleprvw').attr('src', "/assets/images/link.png");
        $("#file_url").val(false);
        $( ".file_name" ).html( filename );
      }
      filerdr.readAsDataURL(input.files[0]);
      $('.remove_file').show();
      }
    } else {
      $(".file_name").html("Please add only pdf, doc, docx document.").addClass("error_file");
      return false;
    }
  }
  $(document).on("click", ".remove_image", function() {
    // $(".post_image").val('');
    // $("#post_upload_attributes_image").replaceWith($('<input id="post_upload_attributes_image" class="post post_image" type="file" name="post[upload_attributes][image]" onchange="showimagepreview(this)" style="visibility: hidden; width: 1px; height: 1px">'));
    $("#image_url").val(true);
    $('#imgprvw').attr('src', '/assets/images/cemera.png');
    $('.remove_image').hide();
  });

  $(document).on("click", ".remove_file", function() {  
    // $("#post_file").val('');
    // $("#post_upload_attributes_file").replaceWith($('<input id="post_upload_attributes_file" class="post post_file" type="file" name="post[upload_attributes][file]" onchange="showfilepreview(this)" style="visibility: hidden; width: 1px; height: 1px">'));
    $( ".file_name" ).html( '' );
    $("#file_url").val(true);
    $('.remove_file').hide();
  });
