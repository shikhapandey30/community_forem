$(document).on('click', ".add_skill", function(){  
  if ($('.skills_attr').val().length!=0 || $(this).data("val")!=undefined) {
    $("#skill_error").hide();
    $('.skills').tagsinput('add', '');
    $('.skills').tagsinput('add', $('.skills_attr').val());
    $('.skillsTag .tag.label.label-info').css({"opacity":"1","display":"inline-block"});
    $('.skills_attr').val('');
  }  
});

//Followers & Followings
$(document).on("keyup", ".searhInput1.following", function(){
  $.ajax({
    method: "get",
    url: "/followings",
    data: {data: this.value}
  });
});

$(document).on("keyup", ".searhInput1.follower", function(){
  $.ajax({
    method: "get",
    url: "/followers",
    data: {data: this.value}
  });
});

$(window).load(function(){
  $(".add_skill").trigger('click');
});

$(document).on('click', ".cancel", function(){
  $(this).closest('form').trigger('reset');
});

$(document).on('click', ".cancel.hided", function(){
  $(this).closest('form').remove();
});


$(document).on('click', ".removeSkills", function(){
  $(".bootstrap-tagsinput span").remove();
  $('.skills').val('')
});

$(function () {
  $('.date').datetimepicker( {format: 'YYYY-MM-DD'});
});

$(document).on('ready', function () {

  $(".dropdown-menu.searchOpt li").click(function(){    
    $(".keyword_filter").val(this.textContent);
  })

    // $("form#reqPassword").validate({      
    //   rules: {          
    //       "user[email]": { required: true },
    //     },
    //    submitHandler: function(form) {
    //      form.submit();
    //    }
    // });

    // $("form.profile_form").validate({
    //   errorPlacement: function(error, element) {
    //     if(element.attr("name") == "user[profile_attributes][gender]") {
    //       error.appendTo($("#gender_error"));
    //     } else if(element.attr("name") == "user[profile_attributes][profile_type]") {
    //       error.appendTo($("#profile_type_error"));
    //     } else if(element.attr("name") == "post[category_id]") {
    //       error.appendTo($("#category_name_error"));
    //     } else if(element.attr("name") == "group[category_id]") {
    //       error.appendTo($("#category_error"));
    //     } else if(element.attr("name") == "contest[category_id]") {
    //       error.appendTo($("#category_name_error"));
    //     } else if(element.attr("name") == "community[category_id]") {
    //       error.appendTo($("#category_name_error"));
    //     } else if(element.attr("name") == "forum_poll[category_id]") {
    //       error.appendTo($("#category_name_error"));
    //     } else if(element.attr("name") == "meeting_room[category_id]") {
    //       error.appendTo($("#category_name_error"));
    //     }
    //      else {
    //       error.insertAfter(element);
    //     }
    //   },
    //   rules: {
    //       "user[first_name]": { required: true },
    //       "user[last_name]": { required: true },
    //       "user[screen_name]": { required: true },          
    //       "user[email]": { required: true },          
    //       "user[password]": { required: true, minlength: 8 },
    //       "user[password_confirmation]": { required: true, minlength: 8,
    //                 equalTo : "#user_password" },
    //       "post[category_id]": { required: true },
    //       "post[topic]": { required: true, maxlength: 80},
    //       "post[title]": { required: true, maxlength: 80},
    //       "post[description]": { required: true, maxlength: 80},
    //       "post[start_date]": { required: true },
    //       "post[expiration_date]": { required: true },
    //       "group[category_id]": { required: true },
    //       "group[topic]": { required: true, maxlength: 80},
    //       "group[headline]": { required: true, maxlength: 80 },
    //       "group[description]": { required: true, maxlength: 80 },
    //       "group[headline]": { required: true, maxlength: 80 },
    //       "forum_poll[category_id]": { required: true },
    //       "forum_poll[topic]": { required: true, maxlength: 80 },
    //       "forum_poll[headline]": { required: true, maxlength: 80 },
    //       "forum_poll[body]": { required: true, maxlength: 80 },
    //       "forum_poll[start_date]": { required: true },
    //       "forum_poll[end_date]": { required: true },
    //       "contest[category_id]": { required: true },
    //       "contest[topic]": { required: true, maxlength: 80 },
    //       "contest[headline]": { required: true, maxlength: 80 },
    //       "contest[description]": { required: true, maxlength: 360 },
    //       "contest[start_date]": { required: true },
    //       "contest[end_date]": { required: true },
    //       "meeting_room[category_id]": { required: true },
    //       "meeting_room[topic]": { required: true, maxlength: 80 },
    //       "meeting_room[headline]": { required: true, maxlength: 80 },
    //       "meeting_room[name]": { required: true, maxlength: 80 },
    //       "meeting_room[slogan]": { required: true, maxlength: 80 },
    //       "community[category_id]": { required: true },
    //       "community[topic]": { required: true, maxlength: 80 },
    //       "community[headline]": { required: true,maxlength: 80 },
    //       "community[slogan]": { required: true, maxlength: 80 },
    //       "community[description]": { required: true, maxlength: 80 }
    //   },
    //   submitHandler: function(form) {
    //    $('form.profile_form').submit();
    //   }
    // });
});

