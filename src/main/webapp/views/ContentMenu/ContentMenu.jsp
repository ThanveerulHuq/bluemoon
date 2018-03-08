<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- <c:import url="/views/shared/_headerIncludes.jsp"></c:import> --%>
<title>Content Edit </title>
<!-- <link href="https://storage.googleapis.com/sanm_ui_standard/v4/styles/ui.jqgrid.css" rel='stylesheet' type='text/css'> -->
<!-- <script src="https://storage.googleapis.com/sanm_ui_standard/v4/scripts/grid.locale-en.js" type="text/javascript"></script> -->
<!-- <script src="https://storage.googleapis.com/sanm_ui_standard/v4/scripts/jquery.jqGrid.min.js" type="text/javascript"></script> -->
<!-- <link href="https://storage.googleapis.com/sanm_ui_standard/v4/styles/jquery-ui.min.css" rel='stylesheet' type='text/css'> -->
</head>
<body>
	
<h2 class="col-md-8 sanm-title" id="tables">
   	<span>Content</span>
   	</h2>
   	<br>
	<!-- <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
data-target="#ContentModal" id="btn_AddSubMenu"
style="margin-left: 117px;"> -->
<!-- <span class="glyphicon glyphicon-plus" style="padding-left:12px;"></span>
<span style="padding-right:12px;"> Add</span></button> -->
		
        <br>
		<br>
		<div class="col-lg-12 mtop-25">
		<table id="Grid"></table>
		<div id="Pager"></div>
		</div>
      <!-- Modal content-->
      <div class="modal fade" id="ContentModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header row">
<div class="col-xs-10">
  <h4 class="modal-title">Add Content</h4></div>
<div class="col-xs-2">
<button type="button" class="btn btn-danger" id="btn_Close" data-dismiss="modal" style="margin-left: 5px;border-radius: 20px;">CLOSE
</button>
</div>
  
</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
						<!-- Hidden input-->
						<input type="hidden" name="contentmenuid" value="contentmenuid"
							id="val_c_id">

							<!-- Dropdown ControlSub Menu input-->
							<div class="form-group">
 								<label for="inputDropdownControlSubMenu" class="col-sm-4 control-label">Control Sub Menu <span class="fieldMandatory">*</span></label>
									 <div class="col-xs-4 col-md-4">
 										<div class="dropdown">
											 <select class="form-control" id="dll_ControlSubMenu">
											</select>
										</div>
									</div>
 							</div>
							<!-- Dropdown Content Description input-->
						<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Description <span class="fieldMandatory">*</span></label>
								<div class="col-sm-8">
									<input type="text" placeholder="Content Description Name" class="form-control" id="txt_ContentDescription">
								</div>
							</div>
							<!-- Text input Demo Url-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Demo URL <span class="fieldMandatory">*</span></label>
								<div class="col-sm-8">
									<input type="url" placeholder="Demo-Url Name" class="form-control" id="txt_DemoUrl">
								</div>
							</div>
							<!-- Text input Download URL-->
							<!-- <div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Download URL<span class="fieldMandatory">*</span></label>
								<div class="col-sm-8">
									<input type="url" placeholder="Download-Url Name" class="form-control" id="txt_DownloadUrl">
								</div>
							</div>
 										 -->
  
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal" id="btn_save">Save</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	<div class="modal" id="messageModal">
     <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div id="success">success</div>
            </div>
        </div>
    </div>
</div>
<script
	src="<%=request.getContextPath()%>/resources/scripts/ContentMenu/ContentMenu.js"
	type="text/javascript"></script>
</body>
</html>