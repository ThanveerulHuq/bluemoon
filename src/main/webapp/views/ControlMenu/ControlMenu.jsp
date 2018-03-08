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

<title>Demo Project</title>
</head>
<body>
			<h2 class="col-md-8 sanm-title" id="tables">
   	<span>Control Menu</span>
   	</h2>
	<br>
<button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
data-target="#myModal" id="btn_AddControl" data-backdrop="static"
data-keyboard="false" style="margin-left: 117px;">
<span class="glyphicon glyphicon-plus" style="padding-left:12px;"></span> 
<span style="padding-right:12px;"> Add</span>
</button>
		<br>
		<br>
		<!-- <div class="grid-items"> -->
		<div class="col-lg-12 mtop-25">
		<table id="Grid"></table>
		<div id="Pager"></div>
		</div>
	<!-- Add Control Modal <--> 
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header row">
<div class="col-xs-10">
  <h4 class="modal-title">Add New Control</h4></div>
<div class="col-xs-2">
<button type="button" class="btn btn-danger" id="btn_Close" data-dismiss="modal" style="margin-left: 5px;border-radius: 20px;">CLOSE
</button>
</div>
  
</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="inputDropdownRole" class="col-sm-4 control-label">Header
								Name<span class="fieldMandatory">*</span>
							</label>
							<div class="col-xs-4 col-md-4">
								<div class="dropdown">
									<select class="form-control" id="dll_AddHeaderMenuList">
										<option></option>
									</select>
								</div>
							</div>
						</div>
						<!-- Hidden input-->
						<input type="hidden" name="controlmenuid" value="controlmenuid"
							id="val_cm_id">


						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-4 control-label" for="textinput">Control
								-Menu Name<span class="fieldMandatory">*</span>
							</label>
							<div class="col-sm-8">
								<input type="text" placeholder="Control-Menu Name"
									class="form-control" id="txt_cm_desc">
							</div>
						</div>

			<div class="form-group">
  <label for="inputDropdownActive" class="col-sm-4 control-label">Active <span class="fieldMandatory">*</span></label>
  <div class="col-xs-4 col-md-4">
  <div class="dropdown">
   <select class="form-control" id="dll_ControlActive">
  
  <option value="Y">Yes</option>
  <option value="N">No</option>
</select>
</div>
</div>
  </div>

						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								data-dismiss="modal" id="btn_save">Save</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/scripts/ControlMenu/ControlMenu.js"
		type="text/javascript"></script>
</body>


</html>


