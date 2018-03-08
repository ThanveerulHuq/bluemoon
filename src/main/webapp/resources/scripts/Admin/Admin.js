var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$(document).ready(function() {
	ControlMenu();
	HeaderLoad();
});
function HeaderLoad() {
	$.ajax({
				url : shortUrl + "/getActiveHeader",
				success : function(data) {
					var header_html = "<li title='Admin'><a class='navigation-link' > <span class='text-bold'>Admin</span> </a></li>";
					for (var i = 0; i < data.length; i++) {
						header_html += "<li title='"
								+ data[i].hm_desc
								+ "'><a class='navigation-link' > <span class='text-bold'>"
								+ data[i].hm_desc + "</span> </a></li>";
					}
					$('#headerlist').html(header_html);
					$("#headerlist li[title='Admin']").addClass('active');
					$('#headerlist li').click(function() {
						var Header = $(this).find('a span').html();
						Headerclick(Header);
					});
				}
			});
}
function Headerclick(Header) {
	if (Header == 'Admin') {
		window.location = url;
		return false;
	} else {
		window.location = shortUrl + '/Home?hm_desc=' + Header;
	}
}
function ControlMenu() {
	$("#navigation-sidebar ul li").click(
			function() {
				$('#navigation-sidebar ul li').removeClass('active');
				$(this).addClass('active');
				var url = $(this).find('a').attr('name');
				$('#main-content .col-md-10').load(shortUrl+'/'+ url);
			});
	$("#navigation-sidebar ul li").first().addClass('active');
	$('#main-content .col-md-10').load(shortUrl+'/User');
}