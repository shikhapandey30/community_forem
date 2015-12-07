/* For Select Option */	
$(document).on('change', '.select', function(){	
	var text = $(this).find('option:selected').text();
	var val = $(this).find('option:selected').val();	
	$(this).prev().prev('.selectInputField').val(val);
	$(this).prev('.selectInput').val(text);
});

$(document).ready(function(){

	$(".bTextInnrt").height($(".bannerText").height());
	$(".bTextInnrt").width($(".bannerText").width());
	$(".mainCOntnt").css("min-height",($(window).height() - $("header").height()));
//	$(".leftNAv ul").height($(".mainCOntnt").height()-57-116);


/* Forgot pass*/


$(".backLogin").click(function(){
	$(".login").slideDown(500);			
	$(".frgtPass").slideUp(500);
});

$(".frgtPAssLink").click(function(){
	$(".login").slideUp(500);			
	$(".frgtPass").slideDown(500);
});



/* For TAb */	
	
$('ul.tabs li').click(function(){
	var tab_id = $(this).attr('data-tab');

	$('ul.tabs li').removeClass('current');
	$('.tab-content').removeClass('current');

	$(this).addClass('current');
	$("#"+tab_id).addClass('current');
});

$(".enable").click(function(){
	$(this).closest(".col-sm-12").find("input").removeAttr("disabled");
});	


$(".rightMenu").click(function(){
	$(".topRightNav  ul").slideToggle(500);
});			       

/*Left NAvigation*/ 	

$(".leftMenuTab").click(function(){
	$(".leftNAv").animate({left: "00px"},500);
	$(".overLAy").animate({right: "00px"},500);

});

$(".overLAy").click(function(){
	$(".leftNAv").animate({left: "-200px"},500);
	$(".overLAy").animate({right: "-100%"},1000);

});

	


    
if($(window).width() > 768){
  wow = new WOW(
      {
        animateClass: 'animated',
        offset:       100,
        callback:     function(box) {
          console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
        }
      }
    );
    wow.init();
 	/*   document.getElementById('moar').onclick = function() {
      var section = document.createElement('section');
      section.className = 'section--purple wow fadeInDown';
      this.parentNode.insertBefore(section, this);
    }; */
}


});

			
$(window).resize(function(){
	$(".bTextInnrt").height($(".bannerText").height());
	$(".bTextInnrt").width($(".bannerText").width());
	$(".mainCOntnt").css("min-height",($(window).height() - $("header").height()));

});	