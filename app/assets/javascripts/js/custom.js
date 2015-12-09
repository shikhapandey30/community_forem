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
	
  $("form").validate({
      rules: {
          "user[first_name]": { required: true },
          "user[last_name]": { required: true },
          "user[screen_name]": { required: true },
          "user[email]": { required: true },          
          "user[password]": { required: true, minlength: 8 },
          "user[password_confirmation]": { required: true, minlength: 8,
                    equalTo : "#user_password" },
          "profile[first_name]": { required: true },
          "profile[last_name]": { required: true },
          "profile[country]": { required: true },
          "profile[city]": { required: true },
          "profile[street]": { required: true },
          "profile[post_code]": { required: true },
          "profile[gender]": { required: true },
          "profile[phone_no]": { required: true },
          "profile[profile_type]": { required: true },
          "profile[dob]": { required: true },
          "profile[screen_name]": { required: true },
          "profile[location]": { required: true },
          "education_history[course_id]": {required: true},
          "education_history[specialization_id]": {required: true},
          "education_history[institute_id]": {required: true},
          "education_history[course_id]": {required: true},
          "education_history[start_year]": {required: true},
          "education_history[end_year]": {required: true},
          "employment_detail[designation]": {required: true},
          "employment_detail[organization]": {required: true},
          "employment_detail[start_work_date]": {required: true},
          "employment_detail[worked_till]": {required: true},
          "employment_detail[description]": {required: true},
          "employment_detail[designation]": {required: true},
          "skill": {required: true, maxlength: 50}
        },
        messages: {
          // "user[first_name]": "Please enter first name",
          // "user[last_name]": "Please enter second name",
          // "user[screen_name]": "Please enter Screen name",          
          // "user[email]": "Please enter email",
          // "user[password]": "Please enter password",
          // "user[password_confirmation]": "Please enter password",
          // "profile[first_name]": "Please enter first name",
          // "profile[last_name]": "Please enter last name",
          // "profile[country]": "Please enter country",
          // "profile[city]": "Please enter city",
          // "profile[street]": "Please enter street",
          // "profile[post_code]": "Please enter post code",
          // "profile[gender]": "Please enter gender",
          // "profile[phone_no]": "Please enter phone no",
          // "profile[profile_type]": "Please enter profile type",
          // "profile[dob]": "Please enter date of birth", 
          // "profile[screen_name]": "Please enter screen name",
          // "profile[location]": "Please enter location",
          // "profile[phone_no]": "Please enter phone no",
          // "education_history[course_id]": "Please select course",
          // "education_history[institute_id]": "Please select institute",
          // "education_history[start_year]": "Please select starting year",
          // "education_history[end_year]": "Please select end year",
          // "employment_detail[designation]": "Please enter designation",
          // "employment_detail[organization]": "Please enter organization",
          // "employment_detail[start_work_date]": "Please select starting date",
          // "employment_detail[worked_till]": "Please select date",
          // "employment_detail[description]": "Please enter description",
          // "skill": "Please enter skill",
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