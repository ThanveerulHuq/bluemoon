<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Fee Payment</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<div class="content container mtop-50">
	<center>
		<h2>Fee Payment</h2>
	</center>

	<div class="searchStudentDialog mtop-15">
	<form id="searchStudentForm">
	<div class="form-group col-md-12"><label class="col-md-2"><span class="pull-right">Academic Year:</span></label>
			<div class="col-md-2">
<select name="academicYear" class="form-control"
					id="academicYear" >
				<c:forEach items="${academicYear}" var="year" varStatus="status">
				<option value="${year.id}">${year.year}</option>
				</c:forEach>
				</select>
			</div></div>
	<div class="form-group col-md-12">
		<label class="col-md-2"><span class="pull-right">Admission No:</span></label>
		<div class="col-md-3">
			<input id="admissionNo" name="admissionNo" class="form-control" required="true" />
		</div>
		<div class="col-md-2">
			<div class="pull-left">
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</div>
		</div>
		<label class="col-md-2"><span class="pull-right errMsgForAdmissionNo" style="color:red;display:none">Please enter valid admission number...</span></label>
				
		
	</form>	
	</div>
	
	<div class="saveFeeDialog mtop-15" style="display:none">
		<form:form id="saveFeeForm" method="POST" action="/SDMS/SaveFeeTxn"
			commandName="FeeTxn" class="mtop-15"
			enctype="multipart/form-data">
			<div class="form-group col-md-12">
				<!-- 			<span class="pull-right" style="color:red">*</span> -->
				<label class="col-md-2"><span class="pull-right">Admission No:</span></label>
				<div class="col-md-3">
					<input id="admissionIdFound" class="form-control" value="" readonly="true" />
				</div>
				
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Student Name:</span></label>
					<div class="col-md-3">
						<input  class="form-control" id="studentName" value="" readonly="true" />
					</div>
				</div>	
				</div>
				<div class="form-group col-md-12">
				
				<label class="col-md-2"><span class="pull-right">Balance:</span></label>
				<div class="col-md-3">
					<input class="form-control" id="balance" type="number" readonly="true" />
				</div>
				
				<form:hidden path="studentYearId" name="studentYearId" id="studentYearId" value="" />
							
				
				<label class="col-md-2"><span class="pull-right">Amount Paid:</span></label>
				<div class="col-md-3">
					<form:input path="amountPaid" id="amountPaid" class="form-control" type="number"
						required="true" />
				</div>
				</div>
				<div class="form-group col-md-12">
					<label class="col-md-2"><span class="pull-right">Payment Date:</span> </label>
					<div class="col-md-3">
						
      <form:input path="paymentDate" id="paymentDate" name="paymentDate" class="form-control" required='true' />
					</div>
	
			</div>
			
			<div class="col-md-10">
				<div class="pull-right">
					<form:button type="button" class="btn btn-danger btn-md"
						onclick="clearInput()">Reset</form:button>
					<form:button type="submit" class="btn btn-success"
						onclick="validateForm()">Submit</form:button>
				</div>
			</div>
		</form:form>
	</div>
	 
	</div>
	
	<script type="text/javascript">
	
	$('document').ready(function(){
		  $('#paymentDate').datepicker({ dateFormat: 'yy-mm-dd' }).datepicker("setDate", new Date());
// 		var payment_date= "${FeeTxn.paymentDate}";
// 		document.getElementById("paymentDate").valueAsDate = formatDate(payment_date);
		
		$('#searchStudentForm').submit(function(event){
			event.preventDefault();
			var admissionNo = $('#admissionNo').val();
			var academicYear= $('#academicYear').val();
			$.ajax({
				url: '/SDMS/getStudentByAdNo',
				data: {admissionNo: admissionNo, academicYearId : academicYear },
				method: 'GET',
				success: function(res){
					if(res.id != undefined){
						setupSaveFeeForm(res);
						$('.errMsgForAdmissionNo').hide();
						$('.searchStudentDialog').hide();
						$('.saveFeeDialog').show();
					} else {
						$('.errMsgForAdmissionNo').show();
					}
				},
				error: function(){
					alert('Server error please contact Admin');
				}
			});
		});
		
		function setupSaveFeeForm(data){
			$('#admissionIdFound').val(data.studentsInfo.admissionNo);
			$('#studentName').val(data.studentsInfo.name);
			$('#studentYearId').val(data.id);
			$('#balance').val(data.balance);
		} 
		
/* 		$('#saveFeeForm').submit(function(event){
			event.preventDefault();
		}); */
		
	});
	
	function formatDate(date){
		date=date.split(' ');
	let fmt_date=date[1]+' '+date[2]+' '+date[5];
	fmt_date = new Date(fmt_date);
	return fmt_date;
	}
	
	function validateForm(){
	}
	
	function clearInput(){
		$(':input').val('');
		alert('All fields cleared');
		window.location.reload();
	}
	
	</script>
</body>

</html>