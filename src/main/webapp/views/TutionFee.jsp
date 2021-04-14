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
<title>School Fee By Class</title>
</head>
<body>
<c:import url="/views/shared/header.jsp"></c:import>
<div class="mtop-50">
		<div class="row">
		<div class="col-md-offset-2 col-md-2">
				<div class="col-md-10 mtop-35 mleft-50">
					<select name="academicYear" class="form-control" id="academicYear"
						value="${StudentsInfo.active}">
						<c:forEach items="${academicYear}" var="year" varStatus="status">
							<option value="${year.id}">${year.year}</option>
						</c:forEach>
					</select>
				</div>
				</div>
			<div class="mtop-20 col-md-3">
				<h3 class="">School Fee By Class</h3>
				</div>

			<div class="col-md-4 mtop-40"
				style="padding: 0px; margin-left: -70px;">
				<a class="btn btn-info" href="/SDMS_2021/TutionFeeForm">Add</a>
			</div>
		</div>

		<div class="mtop-20 col-md-4 col-md-offset-3">
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
		url:'getCommonFee?academicYear='+academicYear,
		colNames:['Edit','Standard', 'schoolFee'],
		colModel:[
		{name:'id',index:'id', width:60,align:"center", sorttype:"int",search: false,formatter:formatEdit},
		{name:'classInfo.className',index:'classInfo.className', width:200, align:"center"},
		{name:'schoolFee',index:'schoolFee', width:162,align:"center"}
		],

		search:true,
		pager: '#Pager',
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
		var year= 1;
		$('#academicYear').val(year);
		createGrid(year);
		$('#academicYear').change(function(){
			console.log('changed');
			var academicYear =$('#academicYear').val();
			jQuery("#Grid").jqGrid().setGridParam({url : 'getCommonFee?academicYear='+academicYear}).jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
		});
		});

		function formatEdit (cell,option,row){
			
			return "<a href='/SDMS_2021/EditTutionFee?Feeid="+cell+"' ><span class='glyphicon glyphicon-edit'></span></a>"
		}
 	

</script>

</body>
</html>