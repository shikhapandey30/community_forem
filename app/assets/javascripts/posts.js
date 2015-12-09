

  $(function () {
    $('.date').datetimepicker( {format: 'YYYY-MM-DD'});
    });

    function showimagepreview(input) {
    if (input.files && input.files[0]) {
    var filerdr = new FileReader();
    filerdr.onload = function(e) {

    $('#imgprvw').attr('src', e.target.result);
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
    $('#fleprvw').attr('src', "../assets/images/link.png");
    $( ".file_name" ).html( filename );
    }
    filerdr.readAsDataURL(input.files[0]);
    $('.remove_file').show();
    }
  }
   function showvideopreview(input) {
    if (input.files && input.files[0]) {
    var filerdr = new FileReader();
    var filename = input.files[0].name
    filerdr.onload = function(e) {
    $('iframe').show();
     $('iframe').attr('src', e.target.result);
    }
    filerdr.readAsDataURL(input.files[0]);
    $('.remove_video').show();
    }
  }
