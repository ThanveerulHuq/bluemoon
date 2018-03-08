<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri">${req.requestURI}</c:set>
<base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
<head>
<script>
$('document').ready(function(){
		$('#admintab').click(function(){
			window.location = "Admin";
			return false;
		});
});
</script>
</head>
<nav class="navbar navbar-toggleable-md navbar-inverse navbar-fixed-top bg-inverse" style="position: static;margin-bottom: 0px;">
            
    <div class="container-fluid hidden-" style="cursor:pointer;">
		    	<!-- Brand and toggle get grouped for better mobile display -->
		    	<div class="navbar-header mright-0 mleft-0">
		      <button type="button" class="navbar-toggle mright-0" data-toggle="collapse" data-target="#menu">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <img src="<%=request.getContextPath()%>/resources/styles/images/Developer.sanmina.png" class="pull-left mtop-10">
		      <a class="navbar-brand uppercase text-mediumsize" href="#">
		      	<span>REFERENCE LIBRARY</span>
		      </a>
		      
		      	 <ul class="nav navbar-nav navbar-right">
        <li id='login'><a href="#"><span class="ion-log-in text-center text-mediumsize"></span></a></li>
        
              
      </ul>
		      
		      
		    </div>
		    
		    	<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse pull-right" id="menu">
							 <ul class="nav navbar-nav" id="headerlist">
		      </ul>
		       </div>
	    	</div>
  
    </nav>
    

