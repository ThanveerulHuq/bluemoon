var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$(document).ready(function(){
	$.ajax({
	url:shortUrl+"/getActiveHeader",  
	success: function (data) {
	var header_html='';
	for(var i=0; i<data.length;i++){
	header_html+="<li><a class='navigation-link'> <span class='text-bold'>"+data[i].hm_desc+"</span> </a></li>";
	}
	$('#headerlist').html(header_html);
	$('#headerlist li').click(function(){
	$('#headerlist li').removeClass('active'); // remove any active class
	$(this).addClass('active'); 
	});
	}
	});
	});