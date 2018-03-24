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
<title>Fee Payment Receipt</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
</head>
<body>
<div id="printArea"class="container">
	<table width="890" cellspacing="0" cellpadding="7" style="border:4px double;border-collapse:collapse;">
	<tbody>
	<tr valign="top">
	<td colspan="3" width="514" height="9" style="border:1px dashed">
	<div class="western" align="left"><span style="color: #365f91;"><span style="font-size: medium;"><strong>  Date:</strong></span></span><span style="color: #365f91;">  <strong id="paymentDate"></strong></span></div>
	</td>
	<td width="348" style="border:1px dashed">
	<div class="western" align="left"><span style="font-size: medium;"><span style="color: #365f91;"><strong>  Receipt#</strong>  <strong id="feeTxnId"></strong></span></span></div>
	</td>
	</tr>
	</tbody>
	<tbody>
	<tr valign="top" style="border:1px dashed">
	<td style="background: #e6eed5;" colspan="2" bgcolor="#e6eed5" width="364" height="32">
	<div class="western"><span style="color: #365f91;"><span style="font-size: medium;"><strong>Received From:</strong></span></span></div>
	<div class="western" align="right"><span style="font-size: medium;"><span style="color: #365f91;"><strong>Student Name:</strong></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-size: medium;"><strong><span style="font-family: Calibri, sans-serif;"><span lang="en-US">Class:</span></span></strong></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Section:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-size: medium;"><span style="font-family: Calibri, sans-serif;"><span lang="en-US"><strong>Academic Year:</strong></span></span></span></span></div>
	<div class="western">&nbsp;</div>
	</td>
	<td style="background: #e6eed5;" colspan="2" bgcolor="#e6eed5" width="498">
	<div class="western">&nbsp;</div>
	<div class="western"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.studentsInfo.name}</strong></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.commonFee.classInfo.className}</strong></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.section}</strong></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.commonFee.academicYear.year}</strong></span></span></div>
	<div class="western">&nbsp;</div>
	</td>
	</tr>
	<tr valign="top" style="border:1px dashed">
	<td colspan="2" width="364" height="32">
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Payment Details:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Tuition Fee:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Book Fee:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Uniform Fee:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Islamic Studies:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Van Fee:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Scholarship:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Total:</strong></span></span></span></div>
	<div class="western" align="right"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>Balance Due:</strong></span></span></span></div>
	<div class="western" align="right">&nbsp;</div>
	</td>
	<td colspan="2" width="498">
	<div class="western">&nbsp;</div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.commonFee.schoolFee}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.bookFee}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.uniformFee}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.islamicStudies}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.vanFee}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.scholorship}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.total}</strong></span></span></span></div>
	<div class="western"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.balance}</strong></span></span></span></div>
	<div class="western">&nbsp;</div>
	</td>
	</tr>
	<tr valign="top" style="border:1px dashed">
	<td width="124" height="31">
	<div class="western" align="right"><span style="font-size: medium;"><span style="color: #365f91;"><strong>Amount</strong></span><span style="color: #365f91;"><strong>:</strong></span></span></div>
	<div class="western" align="right"><span style="font-size: medium;"><span style="color: #365f91;"><strong>Amount in words:</strong></span></span></div>
	<div class="western">&nbsp;</div>
	</td>
	<td colspan="2" width="376">
	<div class="western"><span style="font-size: medium;"><span style="color: #365f91;"><strong>${Print.amountPaid}</strong></span><span style="color: #365f91;"></span></span></div>
	</td>
	<td width="348" style="border:1px dashed">
	<div class="western"><span style="color: #365f91;"><span style="font-size: medium;"><strong>Received By:</strong></span></span></div>
	</td>
	</tr>
	</tbody>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var feeTxnId = "${Print.id}";
		if(feeTxnId != ''){
			var d = new Date("${Print.paymentDate}");
			$('#feeTxnId').html(feeTxnId);
			$('#paymentDate').html(d.toLocaleDateString('en-GB'));
			printDiv('printArea');
		} else {
			window.location = "/SDMS/FeeTxn";
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