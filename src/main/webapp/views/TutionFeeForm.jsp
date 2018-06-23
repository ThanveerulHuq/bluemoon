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
		<form:form method="POST" action="/SDMS/SetFee" commandName="CommonFee"
			class="mtop-15" enctype="multipart/form-data">
			<form:hidden path="id" name="id" />
			<div class="form-group col-md-12 mtop-20">
				<!-- 			<span class="pull-right" style="color:red">*</span> -->
				<label class="col-md-2"><span class="pull-right">Academic
						Year:</span></label>
				<div class="col-md-2">
					<select path="academicYear.id" name="academicYear.id"
						class="form-control" id="academicYear"
						value="${StudentsInfo.active}">
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
					<form:hidden path="StudentId" name="StudentId" id="StudentId" />--%>
					<input path="areaInfo.id" name="areaInfo.id" id="areaInfo"
						value="${areaId}" style="display: none;" /> <select
						class="form-control" id="classId" path="classInfo.classId"
						name="classInfo.classId">
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
					<form:input id="tutionFee" class="form-control feeinput"
						path="termFee" required="true" type="number" />
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Book
						Fee:</span> </label>
				<div class="col-md-3">
					<form:input id="bookFee" class="form-control feeinput"
						path="bookFee" required="true" type="number" />
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Uniform
						Fee:</span> </label>
				<div class="col-md-3">
					<form:input id="uniformFee" class="form-control feeinput"
						path="uniformFee" required="true" type="number" />
				</div>
			</div>
			<div class="col-md-7">
				<div class="pull-right">
					<form:button type="button" class="btn btn-danger btn-md"
						onclick="clearInput()">Reset</form:button>
					<form:button type="submit" class="btn btn-success" id="btn_submit"
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
			var academicYr = '${CommonFee.academicYear.id}';
			var classId = '${CommonFee.classInfo.classId}';
			if (academicYr == '') {
				var d = new Date();
				var year = d.getFullYear();
				year = year - 2017;
				if (d.getMonth() < 2) {
					year = year - 1;
				}
				$('#academicYear').val(year);
			} else {
				$('#academicYear').val(academicYr);
			}
			if (classId != '') {
				$('#classId').val(classId);
			}
			
			$('#academicYear,#classId').change(function(){
				var year=$('#academicYear').val();
				var id=$('#classId').val();
				var areaId=$('#areaInfo').val();
				if(!(year =='${CommonFee.academicYear.id}'&&id=='${CommonFee.classInfo.classId}')){
				$.ajax({
					url: '/SDMS/ValidateFee?academicYear='+year+'&&classId='+id+'&&Area='+areaId,
					method: 'GET',
					success: function(res){
					if(res == "exist"){
					$('#btn_submit').attr('disabled','true');
					showalert('Fee already defined for this standard in selected academic year','error');
					} else {
					$('#btn_submit').removeAttr( "disabled" );
					}
					},
					error: function(){
					showalert('Server error please contact Admin','error');
					}
					});
				}else{
					$('#btn_submit').removeAttr( "disabled" );
				}
				});
	

		});
		function validateForm() {
			if ($('#classId').val() == '-1') {
				event.preventDefault();
				showalert('Please select a class', 'error');
			}

		}
		function clearInput() {
			$(':input').not('#classId,#section,#academicYear').val('');
			$('#classId,#section').val('-1');
			showalert('All fields cleared', 'error')
		}
	</script>
</body>
</html>