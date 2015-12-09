$(document).on('click', ".add_skill", function(){
  if ($('.skills_attr').val().length!=0) {
    $('.skills').tagsinput('add', '');
    $('.skills').tagsinput('add', $('.skills_attr').val());
    $('.skillsTag .tag.label.label-info').css({"opacity":"1","display":"inline-block"});
    $('.skills_attr').val('');
  }  
});

$(document).on('click', ".cancel", function(){
  $(this).closest('form').trigger('reset');
});

$(document).on('click', ".removeSkills", function(){
  $(".bootstrap-tagsinput span").remove();
  $('.skills').val('')
});

$(function () {
  $('.date').datetimepicker( {format: 'YYYY-MM-DD'});
});

$(document).on('ready', function () {
	
  $("form").validate({
      rules: {
          "user[first_name]": { required: true },
          "user[last_name]": { required: true },
          "user[screen_name]": { required: true },
          "user[email]": { required: true },          
          "user[password]": { required: true, minlength: 8 },
          "user[password_confirmation]": { required: true, minlength: 8,
                    equalTo : "#user_password" },
        },
        messages: {
          // "user[first_name]": "Please enter first name",
          // "user[last_name]": "Please enter second name",
          // "user[screen_name]": "Please enter Screen name",          
          // "user[email]": "Please enter email",          
          submitHandler: function(form) {
              form.submit();
          }
      }
  });

  $("form#reqPassword").validate({
      rules: {
          "user[email]": { required: true },
        },
        messages: {
          "user[email]": "Please enter email",
          submitHandler: function(form) {
              form.submit();
          }
      }
  });

});