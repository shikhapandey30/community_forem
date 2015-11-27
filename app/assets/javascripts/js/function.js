$(document).ready(function(){
	$(".bTextInnrt").height($(".bannerText").height());
	$(".bTextInnrt").width($(".bannerText").width());
	$(".mainCOntnt").css("min-height",($(window).height() - $("header").height()));
	
	$(".leftNAv ul").height($(".mainCOntnt").height()-57);
	




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
    // document.getElementById('moar').onclick = function() {
    //   var section = document.createElement('section');
    //   section.className = 'section--purple wow fadeInDown';
    //   this.parentNode.insertBefore(section, this);
    // };
}

    
});

			
$(window).resize(function(){
	$(".bTextInnrt").height($(".bannerText").height());
	$(".bTextInnrt").width($(".bannerText").width());
	$(".mainCOntnt").css("min-height",($(window).height() - $("header").height()));

});	