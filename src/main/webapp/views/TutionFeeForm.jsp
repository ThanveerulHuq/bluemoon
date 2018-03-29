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
<title>Tution Fee</title>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<div class="mtop-50">
		<div class="mtop-20 col-md-offset-4 col-md-4">
			<h2 class="">Tution Fee</h2>
		</div>
<form:form method="POST" action="/SDMS/SetFee"
			commandName="CommonFee" class="mtop-15"
			enctype="multipart/form-data">
		<div class="form-group col-md-12 mtop-20">
			<!-- 			<span class="pull-right" style="color:red">*</span> -->
			<label class="col-md-2"><span class="pull-right">Academic
					Year:</span></label>
			<div class="col-md-2">
				<select path="academicYear.id" name="academicYear.id" class="form-control"
					id="academicYear" value="${StudentsInfo.active}">
					<c:forEach items="${academicYear}" var="year" varStatus="status">
						<option value="${year.id}">${year.year}</option>
					</c:forEach>
				</select>
			</div>


		</div>

		
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Class:</span>
				</label>
				<div class="col-md-3">
				<%-- 	<form:hidden path="studentYearId" name="studentYearId"
						id="studentYearId" />
					<form:hidden path="StudentId" name="StudentId" id="StudentId" />
					<form:hidden path="FeeId" name="FeeId" id="FeeId" /> --%>
					<select class="form-control" id="classId" path="classInfo.classId" name="classInfo.classId" >
						<option value="-1">---SELECT---</option>
						<c:forEach items="${classes}" var="classInfo" varStatus="status">
							<option value="${classInfo.classId}">${classInfo.className}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Tution
						Fee:</span> </label>
				<div class="col-md-3">
					<form:input id="tutionFee" class="form-control feeinput" path="schoolFee"
						required="true" type="number"  />
				</div>
			</div>
			<div class="col-md-7">
				<div class="pull-right">
					<form:button type="button" class="btn btn-danger btn-md"
						onclick="clearInput()">Reset</form:button>
					<form:button type="submit" class="btn btn-success"
						onclick="validateForm()">Submit</form:button>
				</div>
			</div>
		</form:form>
	</div>
<!-- 	<div class="container" style="margin-top: 25px;"> -->
<!-- 		<div class="row"> -->
<!-- 			<legend></legend> -->
<!-- 			<p> -->
<!-- 				<span class="pull-right"><a href="#">Privacy</a> |</span> -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<script>
		$('document').ready(function() {
			var academicYr = '${StudentsYear.academicYear.id}';
			var classId = '${classId}';
			var section = '${StudentsYear.section}';
			if (academicYr == '') {
				var d = new Date();
				var year = d.getFullYear();
				year = year - 2017;
				if (d.getMonth() < 2) {
					year = year - 1;
				}
				$('#academicYear').val(year);
			}
			if (classId != '') {
				$('#classId').val(classId);
			}
			if (section != '') {
				$('#section').val(section);
			}
			computeTotal();

		});
		function validateForm() {
			if ($('#classId').val() == '-1') {
				event.preventDefault();
				alert('Please select a class');
			}
	

		}
		function clearInput() {
			$(':input').not('#classId,#section,#academicYear').val('');
			$('#classId,#section').val('-1');
			alert('All fields cleared')
		}
	</script>
</body>
</html>