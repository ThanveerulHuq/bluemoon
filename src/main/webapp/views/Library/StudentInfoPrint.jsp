<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Info</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
</head>
<body>
<div id="printArea" class="container">
	<p align="center"><span style="font-family: Calibri, sans-serif;"><span style="font-size: xx-large;"><strong>Student Information Form</strong></span></span></p>
	<p align="center">&nbsp;</p>
	<p align="center">&nbsp;</p>
	<dl>
	<dd>
	<table width="600" cellspacing="0" cellpadding="4" style="border-collapse:collapse;border:4px double">
	<tbody>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Admission no:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.admissionNo}</strong></span></span></p>
	</td>
	<td colspan="2" width="183">
	<p align="center"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Photograph</strong></span></span></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Student name:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.name}</strong></span></span></p>
	</td>
	<td colspan="2" rowspan="6" width="183" style="border:1px dashed">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Age:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.age}</strong></span></span></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Gender:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong id="gender"></strong></span></span></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Date of birth:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong id="dob"></strong></span></span></p></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Aadhar no:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.aadharNo}</strong></span></span></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>EMIS no:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.emisNo}</strong></span></span></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Admission date:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong id="admissionDate"></strong></span></span></p>
	</td>
	<td colspan="2" width="183">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Community:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.community}</strong></span></span></p>
	</td>
	<td width="100">
	<p align="left">&nbsp;</p>
	</td>
	<td width="75">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Father name:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.fatherName}</strong></span></span></p>
	</td>
	<td width="100">
	<p align="left">&nbsp;</p>
	</td>
	<td width="75">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Mother name:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.motherName}</strong></span></span></p>
	</td>
	<td width="100">
	<p align="left">&nbsp;</p>
	</td>
	<td width="75">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Address:</strong></span></span></p>
	</td>
	<td style="background: transparent;" colspan="3" rowspan="3" width="453">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.address}</strong></span></span></p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Mobile no.1:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.mobileNo1}</strong></span></span></p>
	</td>
	<td width="100">
	<p align="left">&nbsp;</p>
	</td>
	<td width="75">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Mobile no.2:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.mobileNo2}</strong></span></span></p>
	</td>
	<td width="100">
	<p align="left">&nbsp;</p>
	</td>
	<td width="75">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	<tr>
	<td style="background: transparent;" width="129">
	<p align="right"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>Previous school:</strong></span></span></p>
	</td>
	<td style="background: transparent;" width="262">
	<p align="left"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><strong>${Print.previousSchool}</strong></span></span></p>
	</td>
	<td width="100">
	<p align="left">&nbsp;</p>
	</td>
	<td width="75">
	<p align="left">&nbsp;</p>
	</td>
	</tr>
	</tbody>
	</table>
	</dd>
	</dl>
	<p align="left">&nbsp;</p>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var studentId = "${Print.studentId}";
		var genderObj = {"m":"male","f":"female"};
		
		if(studentId != ''){
			$('#gender').html(genderObj["${Print.gender}"]);
			var admissionDate = new Date("${Print.admissionDate}");
			var dob = new Date("${Print.dob}");
			$('#admissionDate').html(admissionDate.toLocaleDateString('en-GB'));
			$('#dob').html(dob.toLocaleDateString('en-GB'));
			printDiv('printArea');
		} else {
			window.location = "/SDMS/AddStudent";
		}
		
		function printDiv(div) 
		{
		  var divToPrint=document.getElementById(div);
		  var newWin=window.open('','Print-Window');
		  newWin.document.open();
		  newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');
		  newWin.document.close();
		  setTimeout(function(){newWin.close();},10);
		}
	});
</script>

</body>
</html>