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
<title>Import Students Info</title>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<div class="mtop-50">
		<div class="mtop-20 col-md-offset-4 col-md-4">
			<h2 class="">Download Template</h2>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Download:</span> </label>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-md"
					onclick="downloadTemplate()">Download</button>
			</div>
		</div>
		<div class="mtop-20 col-md-offset-4 col-md-4">
			<h2 class="">Import File</h2>
		</div>
		<form role="form" id="fileForm">
			<div class="form-group col-md-12">
				<label path="file" class="col-md-2"><span class="pull-right">Select File:</span> </label>
				<div class="col-md-3">
					<input type="file" id="file" name="file" multiple="multiple" accept="image/*" >
				</div>
			</div>
			<div class="col-md-7">
				<div class="pull-right">
					<button type="button" class="btn btn-danger btn-md"
						onclick="clearInput()">Reset</button>
					<button type="submit" class="btn btn-success" onClick="validateFile()">
						Submit</button>
				</div>
			</div>
		</form>
	</div>
	
	<script>
	$('document').ready(function() {
			
		});
		function clearInput() {
			$(':input').val('');
			showalert('All fields cleared','error')
		}
		function downloadTemplate() {
			event.preventDefault();
			  var win = window.open("<%=request.getContextPath()%>/resources/template/SDMS_StudentInfo_Template.xls", '_blank');
			  return false;
		}
		function validateFile() {
			event.preventDefault();
			if($('#file').val() == '') {
				showalert('Please select a file');
			} else if ($('#file').val().match(/\.(.*?)$/)[0] !== '.xls' ) {
				showalert('Please select file of .xls format');
			} else {
				uploadFile();
			}
		}
		function uploadFile(){
			$.ajax({
				url : '/SDMS/ImportFileStudentsInfo',
				type : "POST",
				data : new FormData(document.getElementById("fileForm")),
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				dataType : "text",
				success : function(response) {
					if(response != 'FAIL') {
						showalert("Some Records were not processed successfully");
						var win = window.open('downloadError?path='+response, '_blank');
					} else {
						showalert("File processed successfully");
					}
				},
				error : function(error) {
					showalert("Error in processing, Please try again later");
					console.log(error);
				}
			});
		}
	</script>
</body>
</html>