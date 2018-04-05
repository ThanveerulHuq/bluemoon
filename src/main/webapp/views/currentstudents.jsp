<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/views/shared/header_includes.jsp"></c:import>


<script src="<%=request.getContextPath()%>/resources/scripts/gridController.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel='stylesheet' type='text/css'/>
<title>Students Current Year</title>
</head>
<body>
<c:import url="/views/shared/header.jsp"></c:import>
<div class="mtop-50">
		<div class="row">
		<div class="col-md-4">
				<div class="col-md-5 mtop-35 mleft-30">
					<select name="academicYear" class="form-control" id="academicYear"
						value="${StudentsInfo.active}">
						<c:forEach items="${academicYear}" var="year" varStatus="status">
							<option value="${year.id}">${year.year}</option>
						</c:forEach>
					</select>
				</div>
				</div>
			<div class="mtop-20 col-md-4">
				<h2 class="mleft-20">Students Current Year</h2>
			</div>
			
			<div class="col-md-4 mtop-35">
				<a href="StudentYear" class="btn btn-primary pull-right mright-35"><span
					class="glyphicon glyphicon-plus"></span> New Admission</a>
			</div>
		</div>

		<div class="mtop-20 col-md-11" style="width:99%">
	<div class="grid-items">
		<table class="gridContent" id="Grid"></table>
		<div id="Pager"></div>
	</div>
</div>
</div>
<script type="text/javascript">
$('document').ready(
function () {
'use strict';

function createGrid(academicYear){
var grid=$("#Grid");
grid.jqGrid({
url:'getStudentYearByYear?academicYear='+academicYear,
colNames:['Edit','name', 'gender','Father Name','Admission No','EMIS No','Class','Section','Scholorship','Total'],
colModel:[
{name:'id',index:'id', width:60,align:"center", sorttype:"int",search: false,formatter:formatEdit},
{name:'studentsInfo.name',index:'studentsInfo.name', width:200, align:"center", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'studentsInfo.gender',index:'studentsInfo.gender', width:100,align:"center",searchoptions: { sopt: ['eq', 'ne']},formatter:formatGender},
{name:'studentsInfo.fatherName',index:'studentsInfo.fatherName', width:180,align:"center",sorttype:"string", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'studentsInfo.admissionNo',index:'studentsInfo.admissionNo', width:180, align:"center", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'studentsInfo.emisNo',index:'studentsInfo.emisNo', width:180,align:"center",sorttype:"int", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'commonFee.classInfo.className',index:'commonFee.classInfo.className', width:200,align:"center", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'section',index:'section', width:200,align:"center", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'scholorship',index:'scholorship', width:200,align:"center", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
{name:'total',index:'section', width:200,align:"center", searchoptions: { sopt: ['cn','bw','eq', 'ew']}},
],

search:true,
pager: '#Pager',
pageable: true,
// jsonReader:{cell:""},
rowNum: 10,
rowList: [10,25,50],
viewrecords: true,
height: 350,
width:$(".grid-items").width(),


loadonce:true,
datatype: 'json',
// datastr:data,
shrinkToFit: false,
multiselect: false,
autowidth: true,
scroll: false,
sort:'id',
// gridview: true,
scrollOffset: 0,
altRows:true,
altclass:'altrow',


});




$("#Grid").jqGrid('navGrid','#Pager', {
view: false, del: false, add: false, edit: false, cloneToTop: false,search:false,refresh:true},

{}, {}, // default settings for add
{}, // delete
{
}).navSeparatorAdd('#Pager');
jQuery("#Grid").jqGrid('filterToolbar',{searchOperators : true});
$('#refresh_Grid div').append("<span>Reload</span>");
$('INPUT[id^="gs_"]').addClass('form-control input-sm');


//Export data code
jQuery("#Grid").jqGrid('navButtonAdd', "#Pager", {
caption : "Export",
title : "Export",
buttonicon : 'ui-icon ui-icon-document',
id : "btnUserExport",
onClickButton : function() {
},
position : "last"
}).navSeparatorAdd('#Pager');
jQuery(
'<td dir="ltr"><div class="ui-pg-div"><select class="" id="ddlExportData" name="ddlExportData" style="width:90px;"><option value="1" selected="selected" >CSV</option><option value="2">Excel</option><option value="3" >OpenOffice</option></select></div></td>')
.insertBefore('#btnUserExport');
//Export data code
jQuery("#btnUserExport").click(function() {
if ($("#Grid").getRowData().length != 0) {
exportData('#Grid');
} else {
alert("No Data Available to Export");
}
});
function exportData(id) {
//Get Header labels
var Headerlabel = $(id).jqGrid("getGridParam", "colNames");
var data = $(id).getGridParam('data');

var obj = new Object();
obj.items = new Array();
for (var i = 0; i < data.length; i++) {
obj.items.push(data[i]);
}
if (id == '#Grid') {
//console.log("inside first if");
var docType = $("#ddlExportData").val();
}
if (docType == "1")
JSONToFileConvertor(obj, "csv", 1, Headerlabel, id);
else if (docType == "2")
JSONToFileConvertor(obj, "xls", 1, Headerlabel, id);
else
JSONToFileConvertor(obj, "ods", 1, Headerlabel, id);
data = null;
}
function JSONToFileConvertor(JSONData, ReportTitle, ShowLabel, headers,
id) {
//If JSONData is not an object then JSON.parse will parse the JSON string in an Object
var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData)
: JSONData;
var EXT = '';
//This condition will generate the Label/Header
if (ShowLabel) {
var row = "";
if (headers) {
if (ReportTitle == "xls" || ReportTitle == "ods") {
row = headers.join('\t');
} else {
row = headers.join(',');
}
//console.log("headers: "+headers);
} else {
//This loop will extract the label from 1st index of on array
for ( var index in arrData[0]) {
//Now convert each value to string and comma-seprated
if (ReportTitle == "xls" || ReportTitle == "ods") {
row += index + '\t';
} else {
row += index + ',';
}
}
}
//append Label row with line break
EXT += row + '\r\n';
}
//1st loop is to extract each row
for (var i = 0; i < arrData.items.length; i++) {
var row = "";
//2nd loop will extract each column and convert it in string tab-seprated
for ( var index in arrData.items[i]) {
if (index != "_id_" || index != "cb_Grid") {
if (ReportTitle == "csv") {
if (typeof arrData.items[i][index] === "undefined") {
row += '' + '' + ',';
} else {
var celldata = arrData.items[i][index]
.toString()
.replace(/(<([^>]+)>)/ig, '');
row += '' + celldata.indexOf(",") > -1 ? '"'
+ celldata + '"' + ',' : celldata + ',';
}
} else if (ReportTitle == "xls" || ReportTitle == "ods") {
if (typeof arrData.items[i][index] === "undefined") {
row += '' + '' + '\t';
} else {
var celldata = arrData.items[i][index]
.toString()
.replace(/(<([^>]+)>)/ig, '');
row += '' + celldata.indexOf(",") > -1 ? '"'
+ celldata + '"' + '\t' : celldata
+ '\t';
}
}
}
}
row.slice(0, row.length - 1);
//add a line break after each row
EXT += row + '\r\n';
}
if (EXT == '') {
alert("Invalid data");
return;
}
/*
*
* FORCE DOWNLOAD WIPACCT
*
*/
var ext = EXT;
var filename;
var uri;
if (id == "#Grid") {
if (ReportTitle == "csv") {
filename = 'Grid.csv';
uri = 'data:text/csv;charset=utf-8,' + escape(ext);
}
else if (ReportTitle == "xls") {
filename = 'Grid.xls';
uri = 'data:text/xls;charset=utf-8,' + escape(ext);
} else {
filename = 'Grid.ods';
uri = 'data:text/xls;charset=utf-8,' + escape(ext);
}
}
var rv = 0;
var ua = navigator.userAgent;
var re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
if (re.exec(ua) != null) {
rv = parseFloat(RegExp.$1);
}
if (navigator.appName == 'Netscape' & rv >= 11) {
if (ReportTitle == "ods") {
filename = 'Grid.csv';
alert('Since IE does not support .ods download format, Please save the file as <Filename>.ods')
}
var oExpWin = window.open();
oExpWin.document.write(ext);
oExpWin.document.close();
oExpWin.document.execCommand('SaveAs', true, filename);
oExpWin.close();
} else {
//this trick will generate a temp "a" tag
var link = document.createElement("a");
link.href = uri;
link.style = "visibility:hidden";
link.download = filename;
//this part will append the anchor tag and remove it after automatic click
document.body.appendChild(link);
link.click();
document.body.removeChild(link);
}
}
}
var d= new Date();
var year= d.getFullYear();
year = year -2017;
if(d.getMonth()<2){
		year = year-1;
	}
$('#academicYear').val(year);
createGrid(year);
$('#academicYear').change(function(){
// 	console.log('changed');
	var academicYear =$('#academicYear').val();
	jQuery("#Grid").jqGrid().setGridParam({url : 'getStudentYearByYear?academicYear='+academicYear}).jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
});
});
function formatGender(cell,option,row){
	if(cell == 'M'){
		return 'Male';
	}else{
		return 'Female';
	}
}

function formatEdit (cell,option,row){
	
	return "<a href='/SDMS/editStudentYear?studentYrId="+cell+"' ><span class='glyphicon glyphicon-edit'></span></a>"
}




</script>

</body>
</html>