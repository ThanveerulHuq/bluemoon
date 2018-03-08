<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Reference Library</title>
<c:import url="/views/shared/_headerIncludes.jsp"></c:import>
</head>
<body style="overflow-y: hidden;">
	<c:import url="/views/shared/_header.jsp"></c:import>
	<section class="container-fluid padding-0" id="main-content">
	<!-------- !Left sidebar --------> <c:import
		url="/views/shared/_sidebar.jsp"></c:import> <!--End Left sidebar -->
	<!-------- !Main content -------->
	<div class="col-md-10" style="margin-top: 64px; padding-left: 110px;height:526px;">
		<c:import url="/views/Users/Users.jsp"></c:import>
	</div>
	</section><br>
	<jsp:include page="/views/shared/_footer.jsp" />
	<script
		src="<%=request.getContextPath()%>/resources/scripts/Admin/Admin.js"
		type="text/javascript"></script>
	<%-- <script type="text/javascript">
	 var url = document.URL,shortUrl=url.substring(0,url.lastIndexOf("/"));
	$(document).ready(function(){
    ControlMenu();
	HeaderLoad();
	});
	function HeaderLoad(){
		$.ajax({
				url:shortUrl+"/getActiveHeader",			
				success:function(data) {
		var header_html = "<li title='Admin'><a class='navigation-link' > <span class='text-bold'>Admin</span> </a></li>";
		for (var i = 0; i < data.length; i++) {
			header_html += "<li title='" +data[i].hm_desc+
					"'><a class='navigation-link' > <span class='text-bold'>"
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
	function Headerclick(Header){
		if(Header=='Admin'){
			window.location=url;
			return false;
		}
		else
			{
			window.location=shortUrl+'/Home?hm_desc='+Header;
			}
	}
	function ControlMenu(){
		$("#navigation-sidebar ul li").click(function() {
			$('#navigation-sidebar ul li').removeClass('active');
			$(this).addClass('active');
			var url = $(this).find('a').attr('name');
			$('#main-content .col-md-10').load('<%=request.getContextPath()%>/'+url);
		});
		$("#navigation-sidebar ul li").first().addClass('active');
		$('#main-content .col-md-10').load('<%=request.getContextPath()%>/User');
		}
	</script> --%>
</body>
</html>