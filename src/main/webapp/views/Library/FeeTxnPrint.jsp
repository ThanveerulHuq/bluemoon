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
<style type="text/css">
@media print
   {
      #printButton {display:none;}
   }
   
   td {
   	padding-left: 10px;
   	padding-right: 10px;
   	border-bottom: 1px dashed;
   }
</style>
</head>
<body>
<div id="printArea" class="container" style="margin-top:10px">
	<table width="100%" cellspacing="0" cellpadding="4" align="center" style="border:4px double;border-collapse:collapse;padding:0">
	<tbody>
	<tr valign="middle" style="border-bottom: 4px double;">
	<td width="14%" height="63">
	<div>	<img src="<%=request.getContextPath()%>/resources/images/school_logo.jpg" height="50" width="50" style="margin-left: 20px;"/>
	</div>
	</td>
	<td colspan="3" width="86%">
	<div align="center"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: large;"><strong>DHAARUS-SALAAM MATRICULATION SCHOOL</strong></span></span></div>
	<div align="center"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">(Managed by : Dhaarus-Salaam Trust, Salem &ndash; 636 005)</span></span></div>
	<div align="center"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Ph: (0427) 2442018, </span></span><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">+91 98942 50320 | E-mail: <a>dhaarussalaam1@gmail.com</a></span></span></div>
	</td>
	</tr>
	<tr valign="top" style="border-bottom:1px solid;">
	<td width="14%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong>Date:</strong></span></span></div>
	</td>
	<td width="38%" style="border-right:1px dashed;">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong id="paymentDate"></strong></span></span></div>
	</td>
	<td width="15%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong>Receipt # </strong></span></span></div>
	</td>
	<td width="38%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong id="feeTxnId"></strong></span></span></div>
	</td>
	</tr>
	<tr>
	<td colspan="4" valign="top" width="100%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong>Received From:</strong></span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Student Name:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.studentsInfo.name}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Class:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.commonFee.classInfo.className}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Section:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.section}</span></span></div>
	</td>
	</tr>
	<tr valign="top" style="border-bottom:1px solid;">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Academic Year:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.commonFee.academicYear.year}</span></span></div>
	</td>
	</tr>
	<tr>
	<td colspan="4" valign="top" width="100%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong>Payment Details:</strong></span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Tuition Fee:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.commonFee.schoolFee}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Book Fee:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.bookFee}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Uniform Fee:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.uniformFee}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Islamic Studies:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.islamicStudies}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Van Fee:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.vanFee}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Scholarship:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.scholorship}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Total:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.total}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Previously Paid:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.paid}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td colspan="2" width="52%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Balance Due:</span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">${Print.studentYear.balance}</span></span></div>
	</td>
	</tr>
	<tr valign="top">
	<td width="14%">
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong>Amount:</strong></span></span></div>
	<div align="right"><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Amount in words:</span></span></div>
	</td>
	<td width="38%" style="border-right:1px dashed;">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;font-style:bold;">Rs. ${Print.amountPaid}</span></span></div>
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;">Rs. <span id="amountInWords"></span></span></span></div>
	</td>
	<td colspan="2" width="48%">
	<div><span style="font-family: 'Times New Roman', serif;"><span style="font-size: small;"><strong>Received By:</strong></span></span></div>
	</td>
	</tr>
	</tbody>
	</table>
	<div style="text-align:center;margin-top:15px;">
		<button id="printButton" class="btn btn-lg btn-info" onclick="window.print();return false;" >Print Receipt</button>
	</div>
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
			//setTimeout(function(){printDiv('printArea');},10);
			//printDiv('printArea');
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
		  //setTimeout(function(){newWin.close();},10);
		}
		function inWords (num) {
		    if ((num = num).length > 9) return 'Not Available';
		    n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
		    if (!n) return; var str = '';
		    str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'crore ' : '';
		    str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'lakh ' : '';
		    str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'thousand ' : '';
		    str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'hundred ' : '';
		    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only' : 'only';
		    return str;
		}
	});
</script>

</body>
</html>

