<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
					<c:import url="../shared/header_includes.jsp"></c:import>


					<script src="<%=request.getContextPath()%>/resources/scripts/gridController.js"
						type="text/javascript"></script>
					<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel='stylesheet'
						type='text/css' />
					<title>SDMS Student Info</title>
				</head>

				<body>
					<c:import url="../shared/header.jsp"></c:import>
					<div class="mtop-50">
						<div class="mtop-20 col-md-offset-4 col-md-4">
							<h2 class="">Student Class and Fees</h2>
						</div>

						<div class="form-group col-md-12 mtop-20">
							<!-- 			<span class="pull-right" style="color:red">*</span> -->
							<label class="col-md-2"><span class="pull-right">Academic Year:</span></label>
							<div class="col-md-2">
								<select path="academicYear" name="academicYear" class="form-control" id="academicYear"
									value="${StudentsInfo.active}">
									<c:forEach items="${academicYear}" var="year" varStatus="status">
										<option value="${year.id}">${year.year}</option>
									</c:forEach>
								</select>
							</div>


						</div>
						<div class="form-group col-md-12">
							<label class="col-md-2"><span class="pull-right">Student Name:</span> </label>
							<div class="col-md-3">
								<select id="admissionNo" class="form-control" mandatory="true" class="form-control">
									<option>${studentName} ${fatherName}</option>
								</select>
							</div>
							<div class="row col-md-2">
								<!-- 				<button class="btn btn-success" onclick="SearchStudent()" ><span class="glyphicon glyphicon-search"></span> Search</button> -->
							</div>
						</div>
						<!-- 		<div class="form-group col-md-12"> -->
						<!-- 			<label class="col-md-2"><span class="pull-right">Student Name:</span> </label> -->
						<!-- 			<div class="col-md-3"> -->
						<%-- <input class="form-control" id="studentName" disabled="true" value="${studentName}" /> --%>
						<!-- 			</div> -->
						<!-- 			<div class="row"> -->
						<!-- 			<label class="col-md-2"><span class="pull-right">Father Name:</span> </label> -->
						<!-- 			<div class="col-md-3"> -->
						<%-- <input class="form-control" id="fatherName" disabled="true" value="${fatherName}" /> --%>
						<!-- 			</div> -->
						<!-- 			</div> -->
						<!-- 		</div> -->

						<form:form method="POST" action="/SDMS/MapStudent" modelAttribute="StudentsYear" class="mtop-15"
							enctype="multipart/form-data">
							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Class:</span> </label>
								<div class="col-md-3">
									<form:hidden path="studentYearId" name="studentYearId" id="studentYearId" />
									<form:hidden path="StudentId" name="StudentId" id="StudentId" />
									<form:hidden path="FeeId" name="FeeId" id="FeeId" />
									<select class="form-control" id="classId" onchange="getFee()">
										<option value="-1">---SELECT---</option>
										<c:forEach items="${classes}" var="classInfo" varStatus="status">
											<option value="${classInfo.classId}">${classInfo.className}</option>
										</c:forEach>
									</select>
								</div>
								<div class="row">
									<label class="col-md-2"><span class="pull-right">Section:</span> </label>
									<div class="col-md-3">
										<form:select path="section" name="section" class="form-control">
											<option value="-1">---SELECT---</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Tution Fee:</span> </label>
								<div class="col-md-3">
									<input id="tutionFee" class="form-control feeinput" disabled="true" type="number"
										value="${tutionfee}" />
								</div>
								<div class="row">
									<label class="col-md-2"><span class="pull-right">Book Fee:</span> </label>
									<div class="col-md-3">
										<input id="bookFee" class="form-control feeinput" type="number" required="true"
											disabled="true" value="${bookfee}" />
									</div>
								</div>
							</div>
							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Van Fee:</span> </label>
								<div class="col-md-3">
									<form:input path="van_fee" name="van_fee" class="form-control feeinput"
										type="number" required="true" />
								</div>
								<div class="row">
									<label class="col-md-2"><span class="pull-right">Islamic Studies:</span> </label>
									<div class="col-md-3">
										<form:input path="islamic_studies" name="islamic_studies"
											class="form-control feeinput" type="number" required="true" />
									</div>
								</div>
							</div>

							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Uniform Fee:</span> </label>
								<div class="col-md-3">
									<form:input path="uniform_fee" name="uniform_fee" class="form-control feeinput"
										type="number" required="true" />
								</div>
								<div class="row">
									<label class="col-md-2"><span class="pull-right">(-) Scholarship:</span> </label>
									<div class="col-md-3">
										<form:input path="scholorship" name="scholorship" class="form-control"
											id="scholorship" type="number" required="true" />
									</div>
								</div>

							</div>

							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Total Fee:</span> </label>
								<div class="col-md-3">
									<input id="total" name="scholorship" class="form-control" disabled="true" />
								</div>
							</div>
							<div class="col-md-10">
								<div class="pull-right">
									<form:button type="button" class="btn btn-danger btn-md" onclick="clearInput()">
										Reset</form:button>
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
						$('document').ready(function () {
							var academicYr = '${StudentsYear.academicYear.id}';
							var classId = '${classId}';
							var section = '${StudentsYear.section}';
							if (academicYr == '') {
								var d = new Date();
								var year = d.getFullYear();
								year = 1;
								$('#academicYear').val(year);
							}
							if (classId != '') {
								$('#classId').val(classId);
							}
							if (section != '') {
								$('#section').val(section);
							}
							computeTotal();
							$('#admissionNo').select2({
								ajax: {
									url: 'getAllStudentsNamebyq',
									dataType: 'json',
									processResults: function (data) {
										var results = [];
										for (index in data) {
											results.push({ 'id': data[index].studentId, "text": data[index].name + ',' + data[index].fatherName })
										}
										return {
											results: results
										};
									}
								}
							});
							$('#admissionNo').on('select2:select', function (e) {
								var studentId = '${StudentsYear.studentId}';
								var newId = e.params.data.id;
								var academicYear = $('#academicYear').val();
								if (studentId != newId) {
									checkUnique(newId, academicYear);
								}
								$('#StudentId').val(e.params.data.id);
							});
						});


						// 	function SearchStudent(){
						// 		var admissionNo = $('#admissionNo').val();
						// 		$.ajax({
						// 		url: '/SDMS/getStudentInfoByAdNo?admissionNo='+admissionNo,
						// 		method: 'GET',
						// 		success: function(res){
						// 			console.log(res);
						// 		if(res.studentId != undefined){
						// 			$('#studentName').val(res.name);
						// 			$('#fatherName').val(res.fatherName);
						// 			$('#StudentId').val(res.studentId);
						// 			checkforUnique();
						// 		$('.errMsgForAdmissionNo').hide();
						// 		$('.searchStudentDialog').hide();
						// 		$('.saveFeeDialog').show();
						// 		} else {
						// 		$('.errMsgForAdmissionNo').show();
						// 		}
						// 		},
						// 		error: function(){
						// 		showalert('Server error please contact Admin');
						// 		}
						// 		});
						// 	}
						function getFee() {
							var academicYearId = $('#academicYear').val();
							var classId = $('#classId').val();

							$.ajax({
								url: '/SDMS/getCommonFeeByClass?classId=' + classId + '&academicYearId=' + academicYearId,
								method: 'GET',
								success: function (res) {
									console.log(res);
									if (res.id != undefined) {
										$('#tutionFee').val(res.schoolFee);
										$('#bookFee').val(res.bookFee).change();
										$('#FeeId').val(res.id);
										$('.errMsgForAdmissionNo').hide();
										$('.searchStudentDialog').hide();
										$('.saveFeeDialog').show();
									} else {
										showalert('Fee Not defined for the given Class', 'error')
										$('#tutionFee').val('');
										$('#bookFee').val('').change();
									}
								},
								error: function () {
									showalert('Server error please contact Admin', 'error');
								}
							});
						}
						$('.feeinput,#scholorship').change(function () {
							computeTotal();
						});
						function computeTotal() {
							var total = 0;
							$('.feeinput').each(function () {
								if ($(this).val() != '') {
									total += parseInt($(this).val());
								}
							});
							if ($('#scholorship').val() != '') {
								total -= parseInt($('#scholorship').val());
							}
							$('#total').val(total);
						}

						function validateForm() {
							if ($('#studentName').val() == '') {
								event.preventDefault();
								showalert('Please select a student', 'error');
							}
							if ($('#classId').val() == '-1') {
								event.preventDefault();
								showalert('Please select a class', 'error');
							}
							if ($('#section').val() == '-1') {
								event.preventDefault();
								showalert('Please select a section', 'error');
							}

						}
						function clearInput() {
							$(':input').not('#classId,#section,#academicYear').val('');
							$('#classId,#section').val('-1');
							alert('All fields cleared')
						}



						function checkUnique(id, year) {
							$.ajax({
								url: '/SDMS/CheckStdFrUnique?academicYear=' + year + '&&studentId=' + id,
								method: 'GET',
								success: function (res) {
									if (res == "exist") {
										$('#btn_submit').attr('disabled', 'true');
										showalert('This student already exist for the current academic year', 'error');
									} else {
										$('#btn_submit').removeAttr("disabled");
									}
								},
								error: function () {
									showalert('Server error please contact Admin', 'error');
								}
							});
						}


// 		function checkforUnique(){
// 			var academicYr= $('#academicYear').val();
// 			var admissionNo= $('#admissionNo').val();
// 			var oldAdmissionNo= "${StudentsYear.admissionNo}";
// 			if(admissionNo != oldAdmissionNo){
// 			$.ajax({
// 				url: '/SDMS/CheckStdFrUnique?academicYear='+academicYr+'&&admissionNo='+admissionNo,
// 				method: 'GET',
// 				success: function(res){
// 				if(res == "exist"){
// 				$('#btn_submit').attr('disabled','true');
// 				showalert('This student already exist for the current academic year','error');
// 				} else {
// 				$('#btn_submit').removeAttr( "disabled" );
// 				}
// 				},
// 				error: function(){
// 				showalert('Server error please contact Admin','error');
// 				}
// 				});
// 			}else{
// 				$('#btn_submit').removeAttr( "disabled" );
// 			}
// 		}

					</script>
				</body>

				</html>