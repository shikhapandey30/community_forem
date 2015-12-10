$(document).on('click', ".add_skill", function(){  
  if ($('.skills_attr').val().length!=0 || $(this).data("val")!=undefined) {
    $('.skills').tagsinput('add', '');
    $('.skills').tagsinput('add', $('.skills_attr').val());
    $('.skillsTag .tag.label.label-info').css({"opacity":"1","display":"inline-block"});
    $('.skills_attr').val('');
  }  
});

$(window).load(function(){
  $(".add_skill").trigger('click');
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

    $("form#reqPassword").validate({      
      rules: {          
          "user[email]": { required: true },
        },
       submitHandler: function(form) {
         form.submit();
       }
  });


    $("form.profile_form").validate({
      errorPlacement: function(error, element) {
        if(element.attr("name") == "user[profile_attributes][gender]") {
          error.appendTo($("#gender_error"));
        } else if(element.attr("name") == "user[profile_attributes][profile_type]") {
          error.appendTo($("#profile_type_error"));
        } else {
          error.insertAfter(element);
        }
      },
      rules: {
          "user[first_name]": { required: true },
          "user[last_name]": { required: true },
          "user[screen_name]": { required: true },
          "user[email]": { required: true },          
          "user[password]": { required: true, minlength: 8 },
          "user[password_confirmation]": { required: true, minlength: 8,
                    equalTo : "#user_password" },
          "user[profile_attributes][country]": { required: true , minlength: 5, maxlength: 80},
          "user[profile_attributes][city]": { required: true, minlength: 5, maxlength: 80},
          "user[profile_attributes][street]": { required: true, minlength: 5, maxlength: 80 },
          "user[profile_attributes][post_code]": { required: true, minlength: 4, maxlength: 12 },
          "user[profile_attributes][gender]": { required: true },
          "user[profile_attributes][phone_no]": { required: true, minlength: 10, maxlength: 20 },
          "user[profile_attributes][profile_type]": { required: true },
          "user[profile_attributes][dob]": { required: true },
          "user[screen_name]": { required: true , minlength: 5, maxlength: 80},
          "user[profile_attributes][location]": { required: true, minlength: 5, maxlength: 80 }
        },
       submitHandler: function(form) {
         form.submit();
       }
  });


  // $("form.skill_form").validate({
  //     errorPlacement: function(error, element) {
  //       if(element.attr("name") == "skill") {
  //         error.appendTo($("#skill_error"));
  //       } else {
  //         error.insertAfter(element);
  //       }
  //     },
  //     rules: {
  //         "skill": { required: true, minlength: 5, maxlength: 80 },
  //     },         
  //     submitHandler: function(form) {
  //         form.submit();
  //     }
  // });

  $("form.category_form").validate({
      errorPlacement: function(error, element) {
        if(element.attr("name") == "category_ids[]") {
          error.appendTo($("#category_error"));
        } else {
          error.insertAfter(element);
        }
      },
      rules: {
          "category_ids[]": { required: true }
      },      
      submitHandler: function(form) {
          form.submit();
      }  
  });
});