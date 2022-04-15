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
<c:import url="../shared/header_includes.jsp"></c:import>
<style type="text/css">
@media print
   {
      #printButton {display:none;}
   }
   
   td {
   	margin: 0;
   	padding-top: 5px;
   	padding-bottom: 5px;
   	padding-left: 10px;
   	padding-right: 10px;
   	border-bottom: 1px solid;
   }
   
   .rightBorder {
   	border-right: 1px solid black;
   }
   
</style>
</head>
<body>
<div id="printArea" class="container">
	<div style="text-align:center;margin:15px;">
		<button id="printButton" class="btn btn-lg btn-default pull-left" onclick="window.location='/SDMS_2022/StudentInfo'" >Go Back</button>
		<button id="printButton" class="btn btn-lg btn-info" onclick="window.print();return false;" >Print Document</button>
	</div>

	<table width="100%" cellspacing="0" cellpadding="4" align="center" style="border:4px double;border-collapse:collapse;padding:0">
	<tbody>
	<tr valign="top">
	<td width="75" height="57">
	<div align="left"><img src="<%=request.getContextPath()%>/images/school_logo.jpg" height="50" width="50" style="margin-left: 20px;"/></div>
	</td>
	<td colspan="3" width="572">
	<div align="center"><span style="font-family: 'Calibri', serif;"><span style="font-size: large;"><strong>DHAARUS SALAAM MATRICULATION SCHOOL</strong></span></span></div>
	<div align="center"><span style="font-family: 'Calibri', serif;"><span style="font-size: small;">(Managed by : Dhaarus Salaam Trust, Salem &ndash; 636 005)</span></span></div>
	<div align="center"><span style="font-family: Calibri, sans-serif;"><span style="font-size: large;"><span style="font-family: 'Calibri', serif;"><span style="font-size: small;">Ph: (0427) 2442018, </span></span><span style="font-family: 'Calibri', serif;"><span style="font-size: small;">+91 98942 50320 | E-mail: <a>dhaarussalaam1@gmail.com</a></span></span></span></span></div>
	</td>
	</tr>
	<tr>
	<td colspan="4" valign="top" width="655">
	<div align="center"><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: large;"><strong>STUDENT PROFILE</strong></span></span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div align="left"><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">ADMISSION NO </span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left">${Print.admissionNo}</div>
	</td>
	<td width="170">
	<div align="center"><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">PHOTO</span></span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div align="left"><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">STUDENT NAME</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left">${Print.name}</div>
	</td>
	<td rowspan="11" width="170" height="250" valign="middle">
	<div align="center">
	<c:choose>
    	<c:when test="${not empty PhotoId}">
			<img src="/SDMS_2022/GetFile?docId=${PhotoId}" alt="No Photo Available" width="170" height="230"/>    
		</c:when>
    	<c:otherwise>
        	No Photo Available
    	</c:otherwise>
	</c:choose>
	
	
	</div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">ACADEMIC YEAR</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left"></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">CLASS</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left"></div>
	</td>
	</tr>
		<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">SECTION</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left"></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">AGE</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left">${Print.age}</div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">GENDER</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left"><span id="gender"></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">DATE OF BIRTH</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left"><span id="dob"></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">AADHAR NUMBER</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left">${Print.aadharNo}</div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">EMIS NUMBER</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left">${Print.emisNo}</div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">ADMISSION DATE</span></span></span></div>
	</td>
	<td width="334" class="rightBorder">
	<div align="left"><span id="admissionDate"></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">COMMUNITY</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.community}</div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">RELIGION</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.religion}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">CASTE</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.caste}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">NATIONALITY</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.nationality}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">FATHER NAME</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.fatherName}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">MOTHER NAME</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.motherName}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top" height="100px">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">ADDRESS</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.address}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">MOBILE NUMBER1</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.mobileNo1}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">MOBILE NUMBER2</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.mobileNo2}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">PREVIOUS SCHOOL</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.previousSchool}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	<tr valign="top" height="100px">
	<td colspan="2" width="135" class="rightBorder">
	<div><span style="color: #000000;"><span style="font-family: Calibri;"><span style="font-size: small;">REMARKS</span></span></span></div>
	</td>
	<td width="334">
	<div align="left">${Print.remarks}</div>
	</td>
	<td width="170">
	</td>
	</tr>
	</tbody>
	</table>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var studentId = "${Print.studentId}";
		var genderObj = {"m":"Male","f":"Female"};
		var gender = "${Print.gender}";
		
		if(studentId != ''){
			$('#gender').html(genderObj[gender.toLowerCase()]);
			var admissionDate = new Date("${Print.admissionDate}");
			var dob = new Date("${Print.dob}");
			$('#admissionDate').html(admissionDate.toLocaleDateString('en-GB'));
			$('#dob').html(dob.toLocaleDateString('en-GB'));
			//printDiv('printArea');
		} else {
			window.location = "/SDMS_2022/AddStudent";
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