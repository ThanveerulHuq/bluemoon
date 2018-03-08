<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='cache-control' content='no-cache'>
	<script
		src="<%=request.getContextPath()%>/resources/scripts/PageTemplate/PageTemplate.js"
		type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sanmina template - http://code.sanmina.com/v4/</title>
</head>
<body>
<h2 class="col-md-8 sanm-title" id="tables">
   	<span>Page Template</span>
   	</h2>
		<br>
		<button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
data-target="#AddPageModal" data-backdrop="static"
data-keyboard="false" style="margin-left: 117px;" id="addpage">
<span class="glyphicon glyphicon-plus" style="padding-left:12px;"></span>
<span style="padding-right:12px;"> Add</span>
</button>
		<br> <br>
		<!-- Jq grid -->
		<div class="col-lg-12 mtop-25">
		<div class="grid-items">
			<table id="contents"></table>
			<div id="navbtns"></div>
		</div>
		</div>
	<!-------- !Sidebar navigation --------> </section>
	<div class="container" style="overflow-y: scroll; overflow-x: hidden;">
		<div class="modal fade" id="AddPageModal" role="dialog">
		
			<div class="modal-dialog" style="width:1115px;text-align:left;" >
				<div class="modal-content">
					<div class="modal-header row">
<div class="col-xs-10">
  <h4 class="modal-title">Add Page Template</h4></div>
<div class="col-xs-2">
<button type="button" class="btn btn-danger" id="btn_Close" data-dismiss="modal" style="margin-left: 85px;border-radius: 20px;">CLOSE
</button>
</div>
  
</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-2 control-label">Description <span
									class="fieldMandatory">*</span></label>
								<div class="col-sm-10" >
									<input type="text" placeholder="Description of the page"
										class="form-control" id="addesc">
								</div>
							</div>
							
											
								<div class="form-group">
  <label for="inputDropdownActive" class="col-sm-2 control-label">Active <span class="fieldMandatory">*</span></label>
  <div class="col-xs-4 col-md-4">
  <div class="dropdown">
   <select class="form-control" id="dll_PageTemplateActive">
  
  <option value="Y">Yes</option>
  <option value="N">No</option>
</select>
</div>
</div>
  </div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">Template <span
									class="fieldMandatory">*</span></label>
								<div class="col-sm-10" id='temptext'>
									<!-- <textarea id="template"></textarea> -->	
									<textarea class="form-control" rows="15" id="template" placeholder="Paste your Templates here"></textarea>
								</div>
								<input type="hidden" value="" id="pageid">
							</div>
					</div>
					
	
  
  
					<div class="modal-footer" style="padding: 15px;">
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							id="btn_submit">Save</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="btn_cancel">Cancel</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>