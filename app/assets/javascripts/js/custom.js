$(document).on('click', ".add_skill", function(){	
  $('.skills').tagsinput('add', '');
  $('.skills').tagsinput('add', $('.skills_attr').val());
  $('.skillsTag .tag.label.label-info').css({"opacity":"1","display":"inline-block"});
  $('.skills_attr').val('');
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