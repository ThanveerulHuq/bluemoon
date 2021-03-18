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
				<c:forEach items="${academicYear}" var="year" varStatus="status">
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
			<tr><td>TUTION FEE</td><td><p id="tot_tution"></p></td><td><p id="bal_tution"></p></td><td><form:input path="schoolFee" id="schoolFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>BOOK FEE</td><td><p id="tot_book"></p></td><td><p id="bal_book"></p></td><td><form:input path="bookFee" id="bookFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>UNIFORM FEE</td><td><p id="tot_uniform"></p></td><td><p id="bal_uniform"></p></td><td><form:input path="uniformFee" id="uniformFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>ISLAMIC STUDIES</td><td><p id="tot_islamic"></p></td><td><p id="bal_islamic"></p></td><td><form:input path="islamicStudies" id="islamicStudies" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>VAN FEE</td><td><p id="tot_van"></p></td><td><p id="bal_van"></p></td><td><form:input path="vanFee" id="vanFee" class="form-control fee-input" type="number"
						required="true" /></td>
			</tr>
			<tr><td>(-)SCHOLORSHIP</td><td colspan=2><p id="scholarship"></p></td><td></td>
			</tr>
			<tr><td>(-)CORONA CONCESSION</td><td colspan=2><p id="corona_concession"></p></td><td></td>
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
			$('#tot_tution').text(data.commonFee.schoolFee);
			$('#bal_tution').text(data.commonFee.schoolFee-data.paidFee.schoolFee);
			$('#tot_book').text(data.commonFee.bookFee);
			$('#bal_book').text(data.commonFee.bookFee-data.paidFee.bookFee);
			$('#tot_uniform').text(data.uniformFee);
			$('#bal_uniform').text(data.uniformFee-data.paidFee.uniformFee);
			$('#tot_islamic').text(data.islamicStudies);
			$('#bal_islamic').text(data.islamicStudies-data.paidFee.islamicStudies);
			$('#tot_van').text(data.vanFee);
			$('#bal_van').text(data.vanFee-data.paidFee.vanFee);
			$('#scholarship').text(data.scholorship);
			$('#corona_concession').text(data.commonFee.corona_concession);
			$('#total_fee').text(data.total);
			paidfee=data.paidFee.schoolFee+data.paidFee.bookFee+data.paidFee.uniformFee+data.paidFee.islamicStudies+data.paidFee.vanFee;
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
		$('#tot_paid').removeAttr('disabled');
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