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

		<div class="form-group col-md-12 mtop-20">
			<!-- 			<span class="pull-right" style="color:red">*</span> -->
			<label class="col-md-2"><span class="pull-right">Academic
					Year:</span></label>
			<div class="col-md-2">
				<select path="academicYear" name="academicYear" class="form-control"
					id="academicYear" value="${StudentsInfo.active}">
					<c:forEach items="${academicYear}" var="year" varStatus="status">
						<option value="${year.id}">${year.year}</option>
					</c:forEach>
				</select>
			</div>


		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Student
					Name:</span> </label>
			<div class="col-md-3">
				<select id="admissionNo" class="form-control" mandatory="true"
					class="form-control"><option>${studentName}
						${fatherName}</option></select>
			</div>
			<div class="row col-md-2"></div>
		</div>

		<form:form method="POST" action="/SDMS/MapStudent"
			commandName="StudentsYear" class="mtop-15"
			enctype="multipart/form-data">
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Class:</span>
				</label>
				<div class="col-md-3">
					<form:hidden path="studentYearId" name="studentYearId"
						id="studentYearId" />
					<form:hidden path="StudentId" name="StudentId" id="StudentId" />
					<form:hidden path="FeeId" name="FeeId" id="FeeId" />
					<input id="areaId" style="display: none;" /> <select
						class="form-control" id="classId" onchange="getFee()">
						<option value="-1">---SELECT---</option>
						<c:forEach items="${classes}" var="classInfo" varStatus="status">
							<option value="${classInfo.classId}">${classInfo.className}</option>
						</c:forEach>
					</select>
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Section:</span>
					</label>
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
				<label class="col-md-2"><span class="pull-right">Van
						Fee:</span> </label>
				<div class="col-md-3">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group">
								<label for="Area">Area</label> <select class="form-control"
									id="sel_vanFee">
									<option value="-1">---SELECT---</option>
									<c:forEach items="${vanFees}" var="vanFee" varStatus="status">
										<option value="${vanFee.fee}">${vanFee.route}</option>
									</c:forEach>

								</select>
							</div>
							<div class="form-group">
								<form:input path="van_fee" name="van_fee"
									class="form-control mtop-10 feeinput" id="vanFee"
									readonly="true" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Uniform
							Fee:</span> </label>
					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="form-group col-md-4 padding-0">
									<label for="no_of_sets">No of Sets</label> <select
										class="form-control" id="uniformCount">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
								<div class="form-group">
									<input class="form-control mtop-10" id="uniformFee" readonly="true" value="${StudentYear.common_fee.uniformFee}" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Tution
						Fee:</span> </label>
				<div class="col-md-3">
					<form:input id="tutionFee" path="term_fee" name="term_fee" class="form-control feeinput" readonly="true" type="number"  />
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Book and Uniform
							Fee:</span> </label>
					<div class="col-md-3">
						<form:input id="bookFee" class="form-control feeinput" type="number" name="book_uniform_fee" path="book_uniform_fee"
							required="true" disabled="true" value="${bookfee}" />
					</div>
				</div>
			</div>
		
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Special
						Fee:</span> </label>
				<div class="col-md-3">
					<form:input path="extra_fee" id="specialFee" name="extra_fee"  class="form-control feeinput" />
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">(-)Scholorship:</span>
					</label>
					<div class="col-md-3">
						<form:input path="scholorship" name="scholorship"
							class="form-control" id="scholorship" type="number"
							required="true" />
					</div>
				</div>
			</div>
				<div class="form-group col-md-12">
					<label class="col-md-2"><span class="pull-right">Total
							Fee:</span> </label>
					<div class="col-md-3">
						<input id="total" name="total" class="form-control"
							disabled="true" />
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="pull-right">
					<form:button type="button" class="btn btn-danger btn-md"
						onclick="clearInput()">Reset</form:button>
					<form:button type="submit" class="btn btn-success" id="btn_submit"
						onclick="validateForm()">Submit</form:button>
				</div>
			</div>
		</form:form>
	</div>

	<script>
	var uniformFee=0;
	var bookFee=0;
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
							$('#admissionNo').select2(
							{
							ajax : {url : 'getAllStudentsNamebyq',
									dataType : 'json',
									processResults : function(data) {
									var results = [];
									for (index in data) {
									results.push({'id' : data[index].studentId,
												  'area':data[index].areaInfo.id,
												  "text" : data[index].name+ ','+ data[index].fatherName
										})
										}
									return {results : results};
									}
									}
									});
							$('#admissionNo').on('select2:select', function(e) {
								var studentId = '${StudentsYear.studentId}';
								var newId = e.params.data.id;
								var academicYear = $('#academicYear').val();
								if (studentId != newId) {
									checkUnique(newId, academicYear);
								}
								$('#StudentId').val(e.params.data.id);
								$('#areaId').val(e.params.data.area);
								$('#classId').removeAttr("disabled");
							});
							
                   			// 	for vanfee input
							$('#sel_vanFee').change(function(){
								$('#vanFee').val($(this).val()).change();
								})
							// 	for uniformFee count change 				
								$('#uniformCount').change(function(){
								let total=$(this).val()*(uniformFee);
								$('#uniformFee').val(total).change();
								$('#bookFee').val(total+bookFee).change();
								})
								
							// 	total calculation
								$('.feeinput,#scholorship').change(function() {
									computeTotal();
								});
                   			
							 $('#academicYear').change(function(){
								 checkUnique($('#StudentId').val(), $(this).val()) 
							 });
							
						});
		function getFee() {
			var academicYearId = $('#academicYear').val();
			var classId = $('#classId').val();
			var areaId=$('#areaId').val();

			$.ajax({
				url : '/SDMS/getCommonFeeByClass?classId=' + classId
						+ '&academicYearId=' + academicYearId+ '&areaId=' + areaId,
				method : 'GET',
				success : function(res) {
					console.log(res);
					if (res.id != undefined) {
						$('#tutionFee').val(res.termFee);
						$('#FeeId').val(res.id);
						uniformFee=res.uniformFee;
						bookFee=res.bookFee;
						$('#bookFee').val(res.bookFee+uniformFee).change();
						$('#uniformFee').val((res.uniformFee*$('#uniformCount').val())).change();
					} else {
						showalert('Fee Not defined for the given Class',
								'error')
						$('#tutionFee').val('');
						$('#bookFee').val('').change();
					}
				},
				error : function() {
					showalert('Server error please contact Admin', 'error');
				}
			});
		}
		
		function computeTotal() {
			var total = 0;
			$('.feeinput').each(function() {
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
			$(':input').not('#classId,#section,#academicYear,#sel_vanFee,#uniformCount').val('');
			$('#classId,#section,#sel_vanFee').val('-1');
			$('#uniformCount').val('1');
			alert('All fields cleared')
		}

		function checkUnique(id, year) {
			$.ajax({
						url : '/SDMS/CheckStdFrUnique?academicYear=' + year
								+ '&&studentId=' + id,
						method : 'GET',
						success : function(res) {
							if (res == "exist") {
								$('#btn_submit').attr('disabled', 'true');
								showalert(
										'This student already exist for the current academic year',
										'error');
							} else {
								$('#btn_submit').removeAttr("disabled");
							}
						},
						error : function() {
							showalert('Server error please contact Admin',
									'error');
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
