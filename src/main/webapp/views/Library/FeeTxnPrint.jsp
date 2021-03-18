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
@media print {
	#printButton {
		display: none;
	}
}

td {
	margin: 0;
	padding-top: 0;
	padding-top: 0;
	padding-left: 10px;
	padding-right: 10px;
	border-bottom: 1px solid;
}
</style>
</head>
<body>
	<div id="printArea" class="container" style="margin-top: 10px">

		<div style="text-align: center; margin: 15px;">
			<button id="printButton" class="btn btn-lg btn-default pull-left"
				onclick="window.location='/SDMS/FeeTxn'">Go Back</button>
			<button id="printButton" class="btn btn-lg btn-info"
				onclick="window.print();return false;">Print Receipt</button>
		</div>
		<div id='mainReceipt'>
			<table width="100%" cellspacing="0" cellpadding="4" align="center"
				style="border: 4px double; border-collapse: collapse; padding: 0">
				<tbody>
					<tr valign="middle" style="border-bottom: 4px double;">
						<td width="14%" height="63">
							<div>
								<img
									src="<%=request.getContextPath()%>/resources/images/school_logo.jpg"
									height="50" width="50" style="margin-left: 20px;" />
							</div>
						</td>
						<td colspan="5" width="86%">
							<div align="center">
								<span style="font-family: 'Times New Roman', serif;"><span
									style="font-size: large;"><strong>DHAARUS
											SALAAM MATRICULATION SCHOOL</strong></span></span>
							</div>
							<div align="center">
								<span style="font-family: 'Times New Roman', serif;"><span
									style="font-size: small;">(Managed by : Dhaarus Salaam
										Trust, Salem &ndash; 636 005)</span></span>
							</div>
							<div align="center">
								<span style="font-family: 'Times New Roman', serif;"><span
									style="font-size: small;">Ph: (0427) 2442018, </span></span><span
									style="font-family: 'Times New Roman', serif;"><span
									style="font-size: small;">+91 98942 50320 | E-mail: <a>dhaarussalaam1@gmail.com</a></span></span>
							</div>
						</td>
					</tr>
					<tr valign="top" style="border-bottom: 1px solid;">
						<td width="10%">
							<div>
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>DATE:</strong></span></span>
							</div>
						</td>
						<td colspan="2" width="40%" style="border-right: 1px solid;">
							<div>
								<span style="font-family: 'Calibri', serif;"><span
									style="font-size: small;"><strong class="paymentDate"></strong></span></span>
							</div>
						</td>
						<td colspan="1" width="20%">
							<div>
								<span style="font-family: 'Calibri', sans-serif;"><span
									style="font-size: small;"><strong>RECEIPT # </strong></span></span>
							</div>
						</td>
						<td colspan="2" width="30%">
							<div>
								<span style="font-family: 'Calibri', serif;"><span
									style="font-size: small;"><strong class="feeTxnId"></strong></span></span>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6" valign="top" width="100%">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>RECEIVED FROM</strong></span></span>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="3" width="50%">
							<div align="left">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">ACADEMIC YEAR: <span
										style="padding: 15px;">${Print.studentYear.commonFee.academicYear.year}</span></span></span>
							</div>
						</td>
						
						<td colspan="3" width="50%">&nbsp;</td>
					</tr>
					<tr valign="top">
						<td colspan="3" width="50%">
							<div align="left">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">STUDENT NAME :<span
										style="padding: 15px;">${Print.studentYear.studentsInfo.name}</span></span></span>
							</div>
						</td>
						<td colspan="3" width="50%">&nbsp;</td>
					</tr>
					<tr valign="top">
						<td colspan="1" width="10%">
							<div align="left">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">CLASS:</span></span>
							</div>
						</td>
						<td colspan="1" width="10%">
							<div align="left">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">${Print.studentYear.commonFee.classInfo.className}</span></span>
							</div>
						</td>
						<td colspan="1" width="30%">
							<div align="left">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">SECTION:<span
										style="padding: 15px;"> ${Print.studentYear.section}</span></span></span>
							</div>
						</td>
						<td colspan="3" width="50%">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="6" valign="top" width="100%">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>PAYMENT
											DETAILS</strong></span></span>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="40%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>DESCRIPTION</strong></span></span>
							</div>
						</td>
						<td colspan="1" width="10%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>AMOUNT (INR)</strong></span></span>
							</div>
						</td>
						<td colspan="1" width="15%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>PAID (INR)</strong></span></span>
							</div>
						</td>
						<td colspan="2" width="35%">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>BALANCE (INR)</strong></span></span>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="40%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">TUITION FEE</span></span>
							</div>
						</td>
						<td colspan="1" width="10%" style="border: 1px solid">
							<div align="center">${Print.studentYear.commonFee.schoolFee}</div>
						</td>
						<td width="15%" style="border: 1px solid">
							<div align="center">${Print.schoolFee}</div>
						</td>
						<td colspan="2" width="35%">
							<div align="center">${Print.studentYear.commonFee.schoolFee - (Print.schoolFee + Print.studentYear.paidFee.schoolFee)}</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="30%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">BOOK FEE</span></span>
							</div>
						</td>
						<td colspan="1" width="20%" style="border: 1px solid">
							<div align="center">${Print.studentYear.commonFee.bookFee}</div>
						</td>
						<td width=15% " style="border: 1px solid">
							<div align="center">${Print.bookFee}</div>
						</td>
						<td colspan="2" width="35%">
							<div align="center">${Print.studentYear.commonFee.bookFee - (Print.bookFee + Print.studentYear.paidFee.bookFee)}</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="30%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">UNIFORM FEE</span></span>
							</div>
						</td>
						<td colspan="1" width="20%" style="border: 1px solid">
							<div align="center">${Print.studentYear.uniformFee}</div>
						</td>
						<td width="15%" style="border: 1px solid">
							<div align="center">${Print.uniformFee}</div>
						</td>
						<td colspan="2" width="35%">
							<div align="center">${Print.studentYear.uniformFee - (Print.uniformFee + Print.studentYear.paidFee.uniformFee)}</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="30%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">ISLAMIC STUDIES</span></span>
							</div>
						</td>
						<td colspan="1" width="20%" style="border: 1px solid">
							<div align="center">${Print.studentYear.islamicStudies}</div>
						</td>
						<td width="15%" style="border: 1px solid">
							<div align="center">${Print.islamicStudies}</div>
						</td>
						<td colspan="2" width="35%">
							<div align="center">${Print.studentYear.islamicStudies - (Print.islamicStudies + Print.studentYear.paidFee.islamicStudies)}</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="32%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">VAN FEE</span></span>
							</div>
						</td>
						<td width="20%" style="border: 1px solid">
							<div align="center">${Print.studentYear.vanFee}</div>
						</td>
						<td width="15%" style="border: 1px solid">
							<div align="center">${Print.vanFee}</div>
						</td>
						<td colspan="2" width="25%">
							<div align="center">${Print.studentYear.vanFee - (Print.vanFee + Print.studentYear.paidFee.vanFee)}</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="32%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">SCHOLARSHIP(-)</span></span>
							</div>
						</td>
						<td width="20%" style="border: 1px solid">
							<div align="center">${Print.studentYear.scholorship}</div>
						</td>
						<td width="15%" style="border: 1px solid">
							<div>&nbsp;</div>
						</td>
						<td colspan="2" width="25s%">
							<div>&nbsp;</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="2" width="32%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">CORONA CONCESSION(-)</span></span>
							</div>
						</td>
						<td width="20%" style="border: 1px solid">
							<div align="center">${Print.studentYear.corona_concession}</div>
						</td>
						<td width="15%" style="border: 1px solid">
							<div>&nbsp;</div>
						</td>
						<td colspan="2" width="25s%">
							<div>&nbsp;</div>
						</td>
					</tr>
					<tr valign="top">
						<td rowspan="3" colspan="2" width="30%" style="font-size: 10px;"><span
							style="font-weight: bold;">Payment History: </span> <c:forEach
								var="txn" items="${lastTxns}">
								(<span class="date"><c:out value="${txn.paymentDate}" /></span> -
    							<span> </span>
								<c:out value="${txn.amountPaid}" />
								</span>),
							</c:forEach></td>
						<td colspan="1" width="20%" style="border: 1px solid">
							<div align="right">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>TOTAL FEE</strong></span></span>
							</div>
						</td>
						<td colspan="3" width="50%" style="border: 1px solid">
							<div>
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">${Print.studentYear.total}</span></span>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="1" style="border: 1px solid">
							<div align="right">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>TOTAL PAID</strong></span></span>
							</div>
						</td>
						<td colspan="3">
							<div>
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">${Print.amountPaid}</span></span>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td colspan="1" style="border: 1px solid">
							<div align="right">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>BALANCE</strong></span></span>
							</div>
						</td>
						<td colspan="3">
							<div>
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">${Print.studentYear.total - (Print.amountPaid + Print.studentYear.paidFee.vanFee + Print.studentYear.paidFee.islamicStudies + Print.studentYear.paidFee.uniformFee + Print.studentYear.paidFee.bookFee + Print.studentYear.paidFee.schoolFee)}</span></span>
							</div>
						</td>
					</tr>
					<tr valign="top">
						<td  colspan="1" width="10%" style="border: 1px solid">
							<div align="center">
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>AMOUNT IN
											WORDS:</strong></span></span>
							</div>
						</td>
						<td colspan="2" width="40%">
							<div>
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;">Rs. <span
										class="amountInWords"></span></span></span>
							</div>
						</td>
						<td colspan="3" width="50%" style="border: 1px solid">
							<div>
								<span style="font-family: Calibri, sans-serif;"><span
									style="font-size: small;"><strong>RECEIVED BY :</strong></span></span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr width="100%" style="border: 1px dashed black;">
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var a = [ '', 'one ', 'two ', 'three ', 'four ', 'five ',
							'six ', 'seven ', 'eight ', 'nine ', 'ten ',
							'eleven ', 'twelve ', 'thirteen ', 'fourteen ',
							'fifteen ', 'sixteen ', 'seventeen ', 'eighteen ',
							'nineteen ' ];
					var b = [ '', '', 'twenty', 'thirty', 'forty', 'fifty',
							'sixty', 'seventy', 'eighty', 'ninety' ];
					var feeTxnId = "${Print.id}";

					if (feeTxnId != '') {
						var d = new Date("${Print.paymentDate}");
						$('.feeTxnId').html(feeTxnId);
						$('.paymentDate').html(d.toLocaleDateString('en-GB'));
						var amountInWords = inWords("${Print.amountPaid}");
						$('.amountInWords').html(amountInWords);
						var mainReceipt = $('#mainReceipt').html();
						$('hr').after(mainReceipt);
						$('.date').each(function(i, el) {
							var date = new Date($(el).text());
							$(el).text(convertDate(date));
						});
						//setTimeout(function(){printDiv('printArea');},10);
						//printDiv('printArea');
					} else {
						window.location = "/SDMS/FeeTxn";
					}

					var transactionHistory = "${lastTxns}";

					console.log(transactionHistory)

					function printDiv(div) {
						var divToPrint = document.getElementById(div);
						var newWin = window.open('', 'Print-Window');
						newWin.document.open();
						newWin.document
								.write('<html><body onload="window.print()">'
										+ divToPrint.innerHTML
										+ '</body></html>');
						newWin.document.close();
						//setTimeout(function(){newWin.close();},10);
					}
					function inWords(num) {
						if ((num = num).length > 9)
							return 'Not Available';
						n = ('000000000' + num).substr(-9).match(
								/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
						if (!n)
							return;
						var str = '';
						str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]]
								+ ' ' + a[n[1][1]])
								+ 'crore ' : '';
						str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]]
								+ ' ' + a[n[2][1]])
								+ 'lakh ' : '';
						str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]]
								+ ' ' + a[n[3][1]])
								+ 'thousand ' : '';
						str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]]
								+ ' ' + a[n[4][1]])
								+ 'hundred ' : '';
						str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
								+ (a[Number(n[5])] || b[n[5][0]] + ' '
										+ a[n[5][1]]) + 'only' : 'only';
						return str;
					}
					function convertDate(inputFormat) {
						function pad(s) {
							return (s < 10) ? '0' + s : s;
						}
						var d = new Date(inputFormat)
						return [ pad(d.getDate()), pad(d.getMonth() + 1),
								d.getFullYear() ].join('/')
					}
				});
	</script>

</body>
</html>

