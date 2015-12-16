  $(function () {
    $('.date').datetimepicker( {format: 'YYYY-MM-DD'});
    });

    function showimagepreview(input) {
    if (input.files && input.files[0]) {
    var filerdr = new FileReader();
    filerdr.onload = function(e) {

    $('#imgprvw').attr('src', e.target.result);
    $("#image_url").val(false);
    }
    filerdr.readAsDataURL(input.files[0]);
    $('.remove_image').show();
    }
    
  }
  function showfilepreview(input) {
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
