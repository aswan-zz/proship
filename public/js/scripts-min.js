$(document).ready(function(){
	$(".wp1").waypoint(function(){$(".wp1").addClass("animated fadeInLeft");},{offset:"75%"});
 	$(".wp2").waypoint(function(){$(".wp2").addClass("animated fadeInDown");},{offset:"75%"});
 	$(".wp3").waypoint(function(){$(".wp3").addClass("animated bounceInDown");},{offset:"75%"});
 	$(".wp4").waypoint(function(){$(".wp4").addClass("animated fadeInDown");},{offset:"75%"});
 	$("#featuresSlider").flickity({cellAlign:"left",contain:true,prevNextButtons:false});
 	$("#showcaseSlider").flickity({cellAlign:"left",contain:true,prevNextButtons:false,imagesLoaded:true});
	});
	
$(document).ready(function(){
	$("a.single_image").fancybox({padding:4});
	});
	
$(".nav-toggle").click(function(){
	//alert("line 15");
	$(this).toggleClass("active");
	$(".overlay-boxify").toggleClass("open");
	});
	
$(".overlay ul li a").click(function(){
	//alert("line 21");
	$(".nav-toggle").toggleClass("active");
	$(".overlay-boxify").toggleClass("open");
	});
	
$(".overlay").click(function(){
	//alert("line 27");
	//$(".nav-toggle").toggleClass("active");
	//$(".overlay-boxify").toggleClass("open");
	});
	
$("a[href*=#]:not([href=#])").click(function(){
	//alert("line 33");
	if(location.pathname.replace(/^\//,"")===this.pathname.replace(/^\//,"")&&location.hostname===this.hostname){
		var e=$(this.hash);
		e=e.length?e:$("[name="+this.hash.slice(1)+"]");
		if(e.length){
			$("html,body").animate({scrollTop:e.offset().top},2e3);
			return false;
		}
	}
	});



