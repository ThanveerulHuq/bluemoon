<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/views/shared/header_includes.jsp"></c:import>


<script
	src="<%=request.getContextPath()%>/resources/scripts/gridController.js"
	type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/resources/styles/main.css"
	rel='stylesheet' type='text/css' />
<title>Van Fee</title>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<div class="mtop-50">
		<div class="mtop-20 col-md-offset-4 col-md-4">
			<h2 class="">Van Fee</h2>
		</div>
<form:form method="POST" action="/SDMS/SetVanFee"
			commandName="VanFee" class="mtop-15"
			enctype="multipart/form-data">
			<form:hidden path="id" name="id"/>
			
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Van
						Route:</span> </label>
				<div class="col-md-3">
					<form:input id="route" class="form-control feeinput" path="route"
						required="true" type="text"  />
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Van
						Fee:</span> </label>
				<div class="col-md-3">
					<form:input id="fee" class="form-control feeinput" path="fee"
						required="true" type="number"  />
				</div>
			</div>
			<div class="col-md-7">
				<div class="pull-right">
					<form:button type="button" class="btn btn-danger btn-md"
						onclick="clearInput()">Reset</form:button>
					<form:button type="submit" class="btn btn-success">
						Submit</form:button>
				</div>
			</div>
		</form:form>
	</div>

	<script>
		$('document').ready(function() {
			
		});
		function clearInput() {
			$(':input').val('');
			showalert('All fields cleared','error')
		}
	</script>
</body>
</html>