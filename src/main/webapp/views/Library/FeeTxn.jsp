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
<!-- 	<div class="searchStudentDialog mtop-15"> -->
<%-- 	<form id="searchStudentForm"> --%>
	
<!-- 	<div class="form-group col-md-12"> -->
<!-- 		<label class="col-md-2"><span class="pull-right">Admission No:</span></label> -->
<!-- 		<div class="col-md-3"> -->
<!-- 			<input id="admissionNo" name="admissionNo" class="form-control" required="true" /> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-2"> -->
<!-- 			<div class="pull-left"> -->
<!-- 				<button type="submit" class="btn btn-success">Search</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 		<label class="col-md-2"><span class="pull-right errMsgForAdmissionNo" style="color:red;display:none">Please enter valid admission number...</span></label> -->
				
		
<%-- 	</form>	 --%>
<!-- 	</div> -->
	
	<div class=" mtop-15" style="display:block">
		<form:form id="saveFeeForm" method="POST" action="/SDMS/SaveFeeTxn"
			commandName="FeeTxn" class="mtop-15"
			enctype="multipart/form-data">
			<div class="form-group col-md-12"><label class="col-md-2"><span class="pull-right">Academic Year:</span></label>
			<div class="col-md-2">
<select name="academicYear" class="form-control"
					id="academicYear" >
				<c:forEach items="${academicYear}" var="year">
				<option value="${year.id}">${year.year}</option>
				</c:forEach>
				</select>
			</div>
			<div class="row"><label class="col-md-2"><span class="pull-right">Payment Date:</span> </label>
					<div class="col-md-3">
						
      <form:input path="paymentDate" id="paymentDate" name="paymentDate" class="form-control" required='true' />
					</div></div>
			</div>
			<div class="form-group col-md-12">
				<!-- 			<span class="pull-right" style="color:red">*</span> -->
<!-- 				<label class="col-md-2"><span class="pull-right">Admission No:</span></label> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<input id="admissionIdFound" class="form-control" value="" readonly="true" /> -->
<!-- 				</div> -->
				
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Student Name:</span></label>
					<div class="col-md-3">
						<select  class="form-control" id="studentName" ></select>	
					</div>
						<label class="col-md-1 text-bigger"><span
							class="pull-right">Class:</span> </label>
						<div class="col-md-1">
							<legend class="text-bigger" id="className"></legend>
						</div>
						<label class="col-md-1 text-bigger"><span
							class="pull-right">Section:</span> </label>
						<div class="col-md-1">
							<legend class="text-bigger" id="section"></legend>
						</div>
					</div>	
				</div>
				<div class="form-group col-md-12">
				
<!-- 				<label class="col-md-2"><span class="pull-right">Balance:</span></label> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<input class="form-control" id="balance" type="number" readonly="true" /> -->
<!-- 				</div> -->
				
				<form:hidden path="studentYearId" name="studentYearId" id="studentYearId" value="" />
							
				
				<%-- <label class="col-md-2"><span class="pull-right">Amount Paid:</span></label>
				<div class="col-md-3">
					<form:input path="amountPaid" id="amountPaid" class="form-control" type="number"
						required="true" />
				</div> --%>
				</div>
			<div class="form-group col-md-8 col-md-offset-2">
		<table class="table table-bordered">
			<tr>
				<th class="col-md-1">
					<h5>DESCRIPTION</h5>
				</th>
				<th class="col-md-1" >
					<h5>AMOUNT (INR)</h5>
				</th>
				<th class="col-md-1">
					<h5>BALANCE (INR)</h5>
				</th>
				<th class="col-md-2">
					<h5>PAID (INR)</h5>
				</th>
			</tr>
			<tr><td>TERM FEE</td><td><p id="tot_term"></p></td><td><p id="bal_term"></p></td><td><form:input path="termFee" id="termFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>BOOK AND UNIFORM FEE</td><td><p id="tot_book_uniform"></p></td><td><p id="bal_book_uniform"></p></td><td><form:input path="bookUniformFee" id="bookUniformFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>VAN FEE</td><td><p id="tot_van"></p></td><td><p id="bal_van"></p></td><td><form:input path="vanFee" id="vanFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>EXTRA FEE</td><td><p id="tot_extra"></p></td><td><p id="bal_extra"></p></td><td><form:input path="extraFee" id="extraFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>(-)SCHOLORSHIP</td><td colspan=2><p id="scholarship"></p></td><td></td>
			</tr>
			<tr><td>TOTAL</td><td><p id="total_fee"></p></td><td><p id="tot_balance"></p></td><td><form:input path="amountPaid" id="tot_paid" class="form-control" disabled="true"/></td>
			</tr>
			<tbody>
				<tr>
				</tr></tbody></table></div>
	
	
			
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
		  $('.fee-input').val(0).focus(function(){
			  $(this).val('');
		  });
		  $('#studentName').select2({ajax: {
			    url: 'getAllStudentyearq',
				data: function (params) {
			return {q:params.term,academicYear:$('#academicYear').val()}
			      } ,
			    dataType: 'json',   
			processResults: function (data) {
				var results=[];
			for(index in data){
			    results.push({'id':data[index].id,"text":data[index].studentsInfo.name+','+data[index].studentsInfo.fatherName,"student":data[index]})}
			      return {
			        results: results
			      };
			}}
			  });
			  $('#studentName').on('select2:select', function (e) {
// 				  console.log(e);
			$('#studentYearId').val(e.params.data.id);
			setupSaveFeeForm(e.params.data.student)
			});
		  
// 		var payment_date= "${FeeTxn.paymentDate}";
// 		document.getElementById("paymentDate").valueAsDate = formatDate(payment_date);
		
		$('#studentName').submit(function(event){
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
					showalert('Server error please contact Admin','error');
				}
			});
		});
		
		function setupSaveFeeForm(data){
			console.log(data);
			$('#className').html(data.commonFee.classInfo.className);
			$('#section').html(data.section);
			$('#admissionIdFound').val(data.studentsInfo.admissionNo);
			$('#studentName').val(data.studentsInfo.name);
			$('#studentYearId').val(data.id);
			$('#tot_term').text(data.termFee);
			$('#bal_term').text(data.termFee-data.paidFee.termFee);
			$('#tot_book_uniform').text(data.bookUniformFee);
			$('#bal_book_uniform').text(data.bookUniformFee-data.paidFee.bookUniformFee);
			$('#tot_van').text(data.vanFee);
			$('#bal_van').text(data.vanFee-data.paidFee.vanFee);
			$('#tot_extra').text(data.extraFee);
			$('#bal_extra').text(data.extraFee-data.paidFee.extrafee);
			$('#scholarship').text(data.scholorship);
			$('#total_fee').text(data.total);
			paidfee=data.paidFee.termFee+data.paidFee.bookUniformFee+data.paidFee.vanFee+data.paidFee.extrafee;
			$('#tot_balance').text(data.total - paidfee);
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
		if($('#tot_paid').val() == ''){
			event.preventDefault();
		} else {
			$('#tot_paid').removeAttr('disabled');
		}
	}
	
	function clearInput(){
		$(':input').val('');
		alert('All fields cleared');
		window.location.reload();
	}
	$('.fee-input').change(function(){
		computeTotal();
		});
		function computeTotal(){
			var total=0;
			$('.fee-input').each(function(){
			if($(this).val() != ''){
			total+=parseInt($(this).val());
			}
			});
			$('#tot_paid').val(total);
		}
	
	</script>
</body>

</html>