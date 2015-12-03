$(document).on('click', ".add_skill", function(){
  $('.skills_attributes').tagsinput('add', $('.skills_attr').val());
  $('.skills_attr').val('');
});