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
<div id="printArea" class="container">
	<img src="<%=request.getContextPath()%>/resources/images/dummy_logo_school.png" height="30" width="30" style="margin-right:20px"/><span style="font-size:large"><strong>BlueMoon School</strong></span>
	<p><span>No.6, Vivekanandhar Street,</span>
	<span>Five Roads,</span>
	<span>Salem.</span></p>
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
	<div class="western"><strong>&nbsp;</strong></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.studentsInfo.name}</strong></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.commonFee.classInfo.className}</strong></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.section}</strong></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-size: medium;"><strong>${Print.studentYear.commonFee.academicYear.year}</strong></span></span></div>
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
	<div class="western"><strong>&nbsp;</strong></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.commonFee.schoolFee}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.bookFee}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.uniformFee}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.islamicStudies}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.vanFee}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.scholorship}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.total}</strong></span></span></span></div>
	<div class="western" align="center"><span style="color: #365f91;"><span style="font-family: Calibri, sans-serif;"><span style="font-size: medium;"><strong>${Print.studentYear.balance}</strong></span></span></span></div>
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
	<div class="western"><span style="font-size: medium;"><span style="color: #365f91;"><strong>Rs. ${Print.amountPaid}</strong></span><span style="color: #365f91;"></span></span></div>
	<div class="western"><span style="font-size: medium;"><span style="color: #365f91;"><strong>Rs. <span id="amountInWords"></span></strong></span><span style="color: #365f91;"></span></span></div>
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
		var a = ['','one ','two ','three ','four ', 'five ','six ','seven ','eight ','nine ','ten ','eleven ','twelve ','thirteen ','fourteen ','fifteen ','sixteen ','seventeen ','eighteen ','nineteen '];
		var b = ['', '', 'twenty','thirty','forty','fifty', 'sixty','seventy','eighty','ninety'];
		var feeTxnId = "${Print.id}";
		if(feeTxnId != ''){
			var d = new Date("${Print.paymentDate}");
			$('#feeTxnId').html(feeTxnId);
			$('#paymentDate').html(d.toLocaleDateString('en-GB'));
			var amountInWords = inWords("${Print.amountPaid}");
			$('#amountInWords').html(amountInWords);
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
		function inWords (num) {
		    if ((num = num).length > 9) return 'Not Available';
		    n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
		    if (!n) return; var str = '';
		    str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'crore ' : '';
		    str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'lakh ' : '';
		    str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'thousand ' : '';
		    str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'hundred ' : '';
		    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only ' : '';
		    return str;
		}
	});
</script>

</body>
</html>