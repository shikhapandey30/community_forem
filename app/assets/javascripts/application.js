// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// stube active_admin
//= require jquery
//= require jquery_ujs
//= require select2
//= require private_pub
//= require users
//= require chat
//= require jquery_nested_form
//= require js/smk-accordion.min
//= require js/bootstrap.min
//= require js/wow
//= require js/function
//= require js/tag-input
//= require js/locales
//= require js/bootstrap-datetimepicker
//= require jquery.remotipart
//= require js/custom
//= require js/jquery.nicescroll.min
//= require js/jquery.validationEngine-en
//= require js/jquery.validationEngine
//= require js/validate
$(document).ajaxStart(function() {
  $(".ajax-loading").show();
});

$(document).ajaxStop(function() {	
  $(".ajax-loading").hide();
});
