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

    function showimagepreview(input,profile_image) {
      extension = input.files[0].name.substring( input.files[0].name.lastIndexOf('.') + 1).toLowerCase(); 
      if ( extension == "png" || extension == "jpeg" || extension == "jpg" ) {
        $(".error.img_error").html("");
        if (input.files && input.files[0]) {
        var filerdr = new FileReader();
        filerdr.onload = function(e) {
          $(".uploadPhoto").css('background-image', 'url('+ e.target.result+')');
        if (profile_image == true){
          $('#imgprvw').attr('src', e.target.result);
        }
        $("#image_url").val(false);
        }
        filerdr.readAsDataURL(input.files[0]);
        $('.remove_image').show();
      }
    } else {
      $(".error.img_error").html("Please add only PNG, JPG, JPEG, and BMP Images.");
      return false;
    }
    
  }
  function showfilepreview(input) {
    extension = input.files[0].name.substring( input.files[0].name.lastIndexOf('.') + 1).toLowerCase(); 
    if ( extension == "xls" || extension == "xlsx" || extension == "pdf" || extension == "csv" || extension == "txt" || extension == "doc" || extension == "xml" || extension == "html") {
        $(".file_name").removeClass("error_file");
        $(".file_name").html("");
      if (input.files && input.files[0]) {
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
      $(".file_name").html("Please add only xls and xlsx document.").addClass("error_file");
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
