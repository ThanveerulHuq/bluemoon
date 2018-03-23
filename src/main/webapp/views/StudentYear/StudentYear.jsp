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
<title>SDMS Student Info</title>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<div class="mtop-50">
		<div class="mtop-20 col-md-offset-4 col-md-4">
			<h2 class="">Student Class and Fees</h2>
		</div>
		<form:form method="POST" action="/SDMS/MapStudent"
		commandName="StudentsYear" class="mtop-15"
		enctype="multipart/form-data">
		
		<div class="form-group col-md-12 mtop-20">
			<!-- 			<span class="pull-right" style="color:red">*</span> -->
			<label class="col-md-2"><span class="pull-right">Academic Year:</span></label>
			<div class="col-md-2">
<%-- 				<form:input path="name" class="form-control" required="true" /> --%>
<form:select path="academicYear" name="active" class="form-control"
					id="active" value="${StudentsInfo.active}">
				<c:forEach items="${academicYear}" var="year" varStatus="status">
				<option value="${year.id}">${year.year}</option>
				</c:forEach>
				</form:select>
			</div>
			

		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Admission No:</span> </label>
			<div class="col-md-3">
				<form:input path="admissionNo" id="admissionNo" class="form-control" />
			</div>
			<div class="row col-md-2">
				<button class="btn btn-success"><span class="glyphicon glyphicon-search"></span> Search</button>
		</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Student Name:</span> </label>
			<div class="col-md-3">
				<input class="form-control" id="studentName" />
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Father Name:</span> </label>
			<div class="col-md-3">
				<input  class="form-control" id="fatherName" />
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		</form:form>
	</div>
</body>
</html>