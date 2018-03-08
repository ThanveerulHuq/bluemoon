$(document).ready(function() {
	// !---------------- Secondary navigation ---------------
	$('#navigation-b').affix({
		offset: {
			top: 45,
		},
	});
	// This prevents weird  "jump" when navbar changes to fixed position
	$('.navbar-wrapper').css("height", "126px");
	
	// !---------------- Sidebar navigation ---------------
	$("#navigation-sidebar").affix({
		offset: {
			top: 126,
		}
	});
	$('body').scrollspy({ target: '#navigation-sidebar', offset: 100 });
	
	var sidebarWidth = parseInt($("#navigation-sidebar").parent().css("width")) - (parseInt($("#navigation-sidebar").parent().css("padding-left"))*2);
	
	$("#navigation-sidebar").css("width", sidebarWidth);
	$("#navigation-sidebar.affix").css("top", "45px");
	
	$("#navigation-sidebar").on('affix.bs.affix', function () {
		sidebarWidth = parseInt($("#navigation-sidebar").parent().css("width")) - (parseInt($("#navigation-sidebar").parent().css("padding-left"))*2);
	});
	$("#navigation-sidebar").on('affixed.bs.affix', function () {
		$(this).css("width", sidebarWidth);
		$(this).css("top", "45px");
	});
	$("#navigation-sidebar").on('affixed-top.bs.affix', function () {
		$(this).css("width", "auto");
		$(this).css("top", "auto");
	});
	
	//Internal smooth scroll
    function smoothNav(menuElements){
        menuElements.click(function(e){
      		e.preventDefault();
	      	 $('html, body').stop().animate({
		        'scrollTop': $($(this).attr('href')).offset().top - 60 } , 200, 'swing');
      	})
    }
    smoothNav($('#navigation-sidebar a, #btn-gotop'));
    //Datepicker on forms
    $("#date-needed").datepicker();
	$("#date-needed-btn").click(function(){
		$("#date-needed").datepicker("show");
	})
    //Block all of the links except the ones with the .navigation-link class
    $('a:not(.navigation-link)').on("click", function (e) {
        e.preventDefault();
    });
    
});