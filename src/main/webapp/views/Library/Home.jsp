<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Student Log</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<section class="container mtop-20">
	<center>
		<h2>Admission Form</h2>
	</center>
	<form:form method="POST" action="/SDMS/SaveStudent"
		commandName="StudentsInfo" class="mtop-15" enctype="multipart/form-data" >
			<div class="form-group col-md-12">
<!-- 			<span class="pull-right" style="color:red">*</span> -->
				<label class="col-md-2"><span class="pull-right">Student
						Name:</span></label>
				<div class="col-md-3">
					<form:input path="name" class="form-control" required="true" />
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Age:</span></label>
					<div class="col-md-3">
						<form:input path="age" class="form-control" type="number" required="true" maxlength="2" oninput="javascript: if (this.value.length > this.maxLength) alert('length should not be more than'+this.maxLength);this.value = this.value.slice(0, this.maxLength);"/>
					</div>
				</div>

			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Gender:</span>
				</label>
				<div class="col-md-3">
					<form:select path="gender" class="form-control">
						<option value="-1">SELECT</option>
						<option value="M">Male</option>
						<option value="F">Female</option>
					</form:select>
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Date
							of Birth:</span> </label>
					<div class="col-md-3">
						<form:input path="dob" class="form-control" type="Date"  pattern="MM-dd-yyyy" required='true'/>
					</div>
				</div>

			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Aadhar
						Number:</span> </label>
				<div class="col-md-3">
					<form:input path="aadharNo" class="form-control" type="number" required="true" maxlength="12" oninput="javascript: if (this.value.length > this.maxLength) alert('length should not be more than'+this.maxLength);this.value = this.value.slice(0, this.maxLength);"/>
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">EMIS
							Number:</span> </label>
					<div class="col-md-3">
						<form:input path="emisNo" class="form-control" type="number" required="true" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) alert('length should not be more than'+this.maxLength);this.value = this.value.slice(0, this.maxLength);"/>
					</div>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Admission
						Number:</span> </label>
				<div class="col-md-3">
					<form:input path="admissionNo" class="form-control" required="true"/>
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Admission
							Date:</span> </label>
					<div class="col-md-3">
						<form:input path="admissionDate" class="form-control" type="Date" pattern="YYYY-MM-DD" required="true" />
					</div>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Community:</span>
				</label>
				<div class="col-md-3">
					<form:input path="community" class="form-control" required="true" />
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Mother
							Tongue:</span> </label>
					<div class="col-md-3">
						<form:input path="motherTongue" class="form-control" required="true" />
					</div>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Mobile
						Number 1:</span> </label>
				<div class="col-md-3">
					<form:input path="mobileNo1" class="form-control" required="true" type="number" />
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Mobile
							Number 2:</span> </label>
					<div class="col-md-3">
						<form:input path="mobileNo2" class="form-control" type="number" />
					</div>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Father
						Name:</span> </label>
				<div class="col-md-3">
					<form:input path="fatherName" class="form-control" required="true" />
				</div>
				<div class="row">
					<label class="col-md-2"><span class="pull-right">Mother
							Name:</span> </label>
					<div class="col-md-3">
						<form:input path="motherName" class="form-control" required="true" />
					</div>
				</div>
			</div>

			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Previous
						School:</span> </label>
				<div class="col-md-3">
					<form:input path="previousSchool" class="form-control" />
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Residential
						Address:</span> </label>
				<div class="col-md-5">
					<form:textarea path="address" class="form-control" required="true"
						style="height:90px" />
				</div>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Student Image:</span> </label>
				<div class="col-md-3">
					<input type="file" path="images" name="images" multiple="multiple">
				</div>
			</div>
				<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Birth Certificate or TC:</span> </label>
				<div class="col-md-3">
					<input type="file" path="images" name="images" multiple="multiple">
				</div>
			</div>
				<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Address Proof:</span> </label>
				<div class="col-md-3">
					<input type="file" path="images" name="images" multiple="multiple">
				</div>
			</div>
				<div class="form-group col-md-12">
				<label class="col-md-2"><span class="pull-right">Other Document:</span> </label>
				<div class="col-md-3">
					<input type="file" path="images" name="images" multiple="multiple">
				</div>
			</div>
			<div class="col-md-10"><div class="pull-right"><form:button type="button" class="btn btn-danger btn-md" onclick="clearInput()">Reset</form:button> <form:button type="submit" class="btn btn-success" onclick="validateForm()">Submit</form:button>   </div></div>
	</form:form> </section>
		<div class="container" style="margin-top: 25px;">
	<div class="row">
		<legend></legend>
        <p> <span class="pull-right"><a href="#">Privacy</a> | </span></p>
	</div>
</div>	

	<script type="text/javascript">
	
	function validateForm(){
		if($('#gender').val() == '-1'){
			event.preventDefault();
		alert('please select a valid gender');
		return false;
		}	
		}
	function clearInput(){
		$(':input').not('#gender').val('');
		$('#gender').val('-1');
		alert('All fields cleared')
	}
	
	</script>	
</body>

</html>