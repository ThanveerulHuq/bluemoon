<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Reference Library</title>

<%-- <c:import url="/views/shared/_headerIncludes.jsp"></c:import>
<link href="https://storage.googleapis.com/sanm_ui_standard/v4/styles/ui.jqgrid.css" rel='stylesheet' type='text/css'>
<script src="https://storage.googleapis.com/sanm_ui_standard/v4/scripts/grid.locale-en.js" type="text/javascript"></script>
<script src="https://storage.googleapis.com/sanm_ui_standard/v4/scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
<link href="https://storage.googleapis.com/sanm_ui_standard/v4/styles/jquery-ui.min.css" rel='stylesheet' type='text/css'> --%>


</head>
<body>
		
<h2 class="col-md-8 sanm-title" id="tables">
   	<span>Headers</span>
   	</h2>
	<br>
<button type="button" class="btn btn-danger btn-sm" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#myModal" id="btn_AddHeader"  
style="margin-left:117px;"> 
<span class="glyphicon glyphicon-plus" style="padding-left:12px;"></span>
<span style="padding-right:12px;"><span> Add</span></button>

		<br>
		<br>
		<!-------- Grid -------->
		<div class="col-lg-12 mtop-25">
		<div class="grid-items">
			<table id="Grid"></table>
			<div id="Pager"></div>
		</div>
		</div>
	<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header row">
<div class="col-xs-10">
  <h4 class="modal-title">Add New Header</h4></div>
<div class="col-xs-2">
<button type="button" class="btn btn-danger" id="btn_Close" data-dismiss="modal" style="margin-left: 5px;border-radius: 20px;">CLOSE
</button>
</div>
  
</div>


					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								
								
							</div>
						<!-- Hidden input-->	
<input type="hidden" name="headerid" value="header" id="val_hm_id">
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Enter Header Name<span class="fieldMandatory">*</span></label>
								<div class="col-sm-8" >
								
									<input type="text" placeholder="Header Name"   class="form-control" id="txt_hm_desc" >
								
								</div>
							</div>
							
							
							
										<div class="form-group">
  <label for="inputDropdownActive" class="col-sm-4 control-label">Active <span class="fieldMandatory">*</span></label>
  <div class="col-xs-4 col-md-4">
  <div class="dropdown">
   <select class="form-control" id="dll_HeaderActive">
  
  <option value="Y">Yes</option>
  <option value="N">No</option>
</select>
</div>
</div>
  </div>

							<!-- Text input-->
							
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" id="btn_save"   data-dismiss="modal">Save</button>
								<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_cancel">Cancel</button>
							</div>


						</form>
						
					</div>
				</div>

			</div>
		</div>
 <script src="<%=request.getContextPath()%>/resources/scripts/Header/Header.js"  
 type="text/javascript"></script> 
</body>
</html>