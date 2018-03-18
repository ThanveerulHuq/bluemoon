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
<script src="<%=request.getContextPath()%>/resources/jqGrid/src/jquery.jqGrid.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/jqGrid/src/css/ui.jqgrid-bootstrap.css" rel='stylesheet' type='text/css'/>
<script src="<%=request.getContextPath()%>/resources/scripts/gridController.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/styles/main.css" rel='stylesheet' type='text/css'/>
<title>SDMS Student Info</title>
</head>
<body>
<c:import url="/views/shared/header.jsp"></c:import>
<div class="content">
	<div class="gridWrapper">
		<table class="gridContent" id="dataTable"></table>
	</div>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		colArr = [
            { label: 'Student Id', name: 'studentId', key: true, width: 100 },
            { label: 'Student Name', name: 'name', width: 150 },
            { label: 'Gender', name: 'gender', width: 150 },
            { label: 'D.O.B', name: 'dob', width: 150 },
            { label: 'Age', name: 'age', width: 150 },
            { label: 'Father Name', name: 'fatherName', width: 150 },
            { label: 'Mother Name', name: 'motherName', width: 150 },
            { label: 'Address', name: 'address', width: 300 },
            { label: 'Mother Tongue', name: 'motherTongue', width: 150 },
            { label: 'Community', name: 'community', width: 150 },
            { label: 'Mobile No', name: 'mobileNo1', width: 150 },
            { label: 'Mobile No2', name: 'mobileNo2', width: 150 },
            { label: 'Aadhar No', name: 'aadharNo', width: 150 },
            { label: 'Admission No', name: 'admissionNo', width: 150 },
            { label: 'Admission Date', name: 'admissionDate', width: 150 },
            { label: 'EMIS No', name: 'emisNo', width: 150 },
            { label: 'Previous School', name: 'previousSchool', width: 150 },
            { label: 'Active', name: 'active', width: 150 },
        ];
		loadGrid('#dataTable', '/SDMS/GetStudentInfo', colArr);
	});
</script>
</html>