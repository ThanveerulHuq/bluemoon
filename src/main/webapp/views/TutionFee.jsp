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


<script
	src="<%=request.getContextPath()%>/resources/scripts/gridController.js"
	type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/resources/styles/main.css"
	rel='stylesheet' type='text/css' />
<title>School Fee By Class</title>
<style>
*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}

body {
	font-family: sans-serif;
	background: #f6f9fa;
}

h1 {
	color: #ccc;
	text-align: center;
}

a {
	color: #ccc;
	text-decoration: none;
	outline: none;
}

/*Fun begins*/
.tab_container {
	width: 90%;
	margin: 0 auto;
	padding-top: 70px;
	position: relative;
}

input, section {
	clear: both;
	padding-top: 10px;
	display: none;
}

.tabs {
	font-weight: 700;
	font-size: 18px;
	display: block;
	float: left;
	width: 20%;
	padding: 1.5em;
	color: #757575;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	background: #f0f0f0;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
	#content3, #tab4:checked ~ #content4, #tab5:checked ~ #content5 {
	display: block;
	padding: 20px;
	background: #fff;
	color: #999;
	border-bottom: 2px solid #f0f0f0;
}

.tab_container .tab-content p, .tab_container .tab-content h3 {
	-webkit-animation: fadeInScale 0.7s ease-in-out;
	-moz-animation: fadeInScale 0.7s ease-in-out;
	animation: fadeInScale 0.7s ease-in-out;
}

.tab_container .tab-content h3 {
	text-align: center;
}

.tab_container [id^="tab"]:checked+label {
	background: #fff;
	box-shadow: inset 0 3px #0CE;
}

.tab_container [id^="tab"]:checked+label .fa {
	color: #0CE;
}

label .fa {
	font-size: 1.3em;
	margin: 0 0.4em 0 0;
}

/*Media query*/
@media only screen and (max-width: 930px) {
	label span {
		font-size: 14px;
	}
	label .fa {
		font-size: 14px;
	}
}

@media only screen and (max-width: 768px) {
	label span {
		display: none;
	}
	label .fa {
		font-size: 16px;
	}
	.tab_container {
		width: 98%;
	}
}

/*Content Animation*/
@
keyframes fadeInScale { 0% {
	transform: scale(0.9);
	opacity: 0;
}
100%
{
transform
:
 
scale
(1);

  	
opacity
:
 
1;
}
}
.tab-content{
height:590px;
}
</style>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<div class="mtop-20">
		<div class="tab_container">
			<input id="tab1" type="radio" name="tabs" checked> <label
				for="tab1" class="tabs"><i class="fa fa-code tab"></i><span>Omalur</span></label>

			<input id="tab2" type="radio" name="tabs"> <label for="tab2"
				class="tabs"><i class="fa fa-pencil-square-o tab"></i><span>Salem</span></label>


			<section id="content1" class="tab-content" >
			<div class="row">
				<div class="col-md-offset-1 col-md-3">
					<div class="col-md-8 mtop-10">
						<select name="academicYear" class="form-control" id="academicYear"
							value="${StudentsInfo.active}">
							<c:forEach items="${academicYear}" var="year" varStatus="status">
								<option value="${year.id}">${year.year}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-md-3 padding-0" style="">
					<h3 class="">School Fee By Class</h3>
				</div>

				<div class="col-md-3 col-md-offset-1 mtop-15"
					style="padding: 0px;">
					<a class="btn btn-info" href="/SDMS/TutionFeeForm?Area=1">Add</a>
				</div>
			</div>

			<div class="mtop-20 col-md-10 col-md-offset-1">
				<div class="grid-items">
					<table class="gridContent" id="Grid"></table>
					<div id="Pager"></div>
				</div>
			</div>

			</section>

			<section id="content2" class="tab-content" >
			<div class="row">
				<div class="col-md-offset-1 col-md-3">
					<div class="col-md-8 mtop-10">
						<select name="academicYear" class="form-control" id="academicYear1"
							value="${StudentsInfo.active}">
							<c:forEach items="${academicYear}" var="year" varStatus="status">
								<option value="${year.id}">${year.year}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-md-3 padding-0" style="">
					<h3 class="">School Fee By Class</h3>
				</div>

				<div class="col-md-3 col-md-offset-2 mtop-15"
					style="padding: 0px;">
					<a class="btn btn-info" href="/SDMS/TutionFeeForm?Area=2">Add</a>
				</div>
			</div>
			
<div class="mtop-20 col-md-10 col-md-offset-1">
				<div class="grid-items">
					<table class="gridContent" id="Grid1"></table>
					<div id="Pager1"></div>
				</div>
			</div>

			</section>
		</div>

	</div>
	<script type="text/javascript">
$('document').ready(
		function () {
		'use strict';

		function createGrid(academicYear,grid,pager,area){
		var grid=$(grid);
		grid.jqGrid({
		url:'getCommonFee?academicYear='+academicYear+'&Area='+area,
		colNames:['Edit','Standard', 'Term Fee','Book Fee','Uniform Fee'],
		colModel:[
		{name:'id',index:'id', width:60,align:"center", sorttype:"int",search: false,formatter:formatEdit},
		{name:'classInfo.className',index:'classInfo.className', width:200, align:"center"},
		{name:'termFee',index:'termFee', width:230,align:"center"},
		{name:'bookFee',index:'bookFee', width:230,align:"center"},
		{name:'uniformFee',index:'uniformFee', width:220,align:"center"}
		],

		search:true,
		pager: pager,
		pageable: true,
		// jsonReader:{cell:""},
		rowNum: 10,
		rowList: [10,25,50],
		viewrecords: true,
		height: 400,
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
		}
		
		
		var d= new Date();
		var year= d.getFullYear();
		year = year -2017;
		if(d.getMonth()<2){
				year = year-1;
			}
		$('#academicYear,#academicYear1').val(year);
		createGrid(year,'#Grid','#Pager',1);
		createGrid(year,'#Grid1','#Pager1',2);
		$('#academicYear,#academicYear1').change(function(){
			console.log('changed');
			var academicYear =$(this).val();
			$('#academicYear,#academicYear1').val(academicYear);
			jQuery("#Grid").jqGrid().setGridParam({url : 'getCommonFee?academicYear='+academicYear+'&&Area=1'}).jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
			jQuery("#Grid1").jqGrid().setGridParam({url : 'getCommonFee?academicYear='+academicYear+'&&Area=2'}).jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
		});
		});

		function formatEdit (cell,option,row){
			return "<a href='/SDMS/EditTutionFee?Feeid="+cell+"&Area="+row.areaInfo.id+"' ><span class='glyphicon glyphicon-edit'></span></a>"
		}
 	

</script>

</body>
</html>