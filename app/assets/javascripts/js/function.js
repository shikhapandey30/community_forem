$(document).ready(function(){

/* search Drop Down*/						
$(".searhInput").click(function(){
		$(".searchDropDown").stop().slideDown(500);	
		$(".searchOverLAy").stop().fadeIn(500);	
});

$(".searchOverLAy").click(function(){
	$(".searchDropDown").stop().slideUp(500);
	$(".searchOverLAy").stop().fadeOut(500);	
});

$('.select').change(function(){
		var a = $(this).find('option:selected').text();
		$(this).prev('.selectInput').val(a);
});      						   

if($("body").height() < $(window).height()){
	$("footer").css("position","absolute").css("bottom","0");	
}
else{
	$("footer").css("position","static");
}



$(".searhInput").click(function(){
		$(".searchDropDown").stop().slideDown(500);	
		$(".searchOverLAy").stop().fadeIn(500);	

});


$(".searchOpt a").click(function(){
		var newSrc = $(this).find("img").attr("src");								 
		$(".iconChange").attr("src", newSrc);			
});



$(".addCmnt.inputTextW.small").click(function(){
		$(this).closest(".commentSec").next(".commentShow").find(".clearfix.commentSec.cmntRow.borderNOne").slideDown(500);			
});
$(".Cancel").click(function(){
		$(this).closest(".commentShow").find(".clearfix.commentSec.cmntRow.borderNOne").slideUp(500);			
});




$(".reply").click(function(){
		$(this).closest("div").next(".replyRow").slideToggle(500);			
});





						   
						   
//	$(".bTextInnrt").height($(".bannerText").height());
//	$(".bTextInnrt").width($(".bannerText").width());
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


$(".replyBox").click(function(){
		$(".replyBox textarea").css("display","block").focus();
		$(".replyRowFrwd").css("display","none");	
});


$(".plusIcon").click(function(){
		$(".msgReplyBox").css("display","none");
		$(".newMsgBox").css("display","block");
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
}
else{
	
$(".msgOuter .msgLIstingOuter .cmntRow ").click(function(){
	$('html, body').animate({scrollTop:$('.msgBoxRight').position().top}, 'slow');	
});	

}

$(".scrollbars, .searchDropDown, .msgBox").niceScroll({cursorborder:"0", cursorwidth :"6px", cursorminheight:"50", horizrailenabled:false, cursorcolor:"#999",boxzoom:false});




/* Cat Detail Banner*/
$(".catCover .pTitltOuter").width($(".catCover .pTitltOuter").closest(".innerWIdth550 ").width());

$(".groupName").width($(".groupName").closest(".whiteBox").width());




/*Payment Div Slide Down*/

$(".paymentBtn").click(function(){
		$(this).closest(".connectionRow").next(".paymentDetail").stop().slideToggle(500);			
});



$(".vodeSection span").click(function(){
		$(".vodeSection span").removeClass("activeVote");		
		$(this).addClass("activeVote");			
});


$('[data-toggle="tooltip"]').tooltip(); 


});

			
$(window).resize(function(){
	$(".mainCOntnt").css("min-height",($(window).height() - $("header").height()));
	$(".catCover .pTitltOuter").width($(".catCover .pTitltOuter").closest(".innerWIdth550 ").width());
	$(".groupName").width($(".groupName").closest(".whiteBox").width());
	if($("body").height() < $(window).height()){
	$("footer").css("position","absolute").css("bottom","0");	
	}
	else{
		$("footer").css("position","static");
	}
});	


