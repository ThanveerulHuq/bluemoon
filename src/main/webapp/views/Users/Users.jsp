<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<h2 class="col-md-8 sanm-title" id="tables">
		<span>User Management</span>
	</h2>
	<br>
	<button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
		data-target="#UserModal" id="btn_AddUser" data-backdrop="static"
		data-keyboard="false" style="margin-left: 117px;">
		<span class="glyphicon glyphicon-plus" style="padding-left: 12px;"></span>
		<span style="padding-right: 12px;"> Add</span>
	</button>
	<br>
	<br>
	<div class="col-lg-12 mtop-25">
		<table id="Grid"></table>
		<div id="Pager"></div>
	</div>
	<!-------- !Sidebar navigation -------->
	<div class="container col-lg-9">
		<div class="modal fade" id="UserModal" role="dialog">
			<div class="modal-dialog"
				style="text-align: left; width: 1115px; overflow-y: hidden;">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header row">
						<div class="col-xs-10">
							<h4 class="modal-title">Add New User</h4>
						</div>
						<div class="col-xs-2">
							<button type="button" class="btn btn-danger" id="btn_Close"
								data-dismiss="modal"
								style="margin-left: 85px; border-radius: 20px;">CLOSE</button>
						</div>

					</div>

					<div class="modal-body" style="height: 490px; overflow-y: hidden;">
						<form class="form-horizontal" role="form">
							<input type="hidden" class="form-control" id="txt_hidden"
								value="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">User
									Name <span class="fieldMandatory">*</span>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="txt_screenName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Email
									<span class="fieldMandatory">*</span>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="txt_emailId">
								</div>
							</div>

							<div class="form-group">
								<label for="inputDropdownRole" class="col-sm-4 control-label">Role
									<span class="fieldMandatory">*</span>
								</label>
								<div class="col-xs-4 col-md-4">
									<div class="dropdown">
										<select class="form-control" id="dll_Role">
											<option></option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="inputDropdownActive" class="col-sm-4 control-label">Active
									<span class="fieldMandatory">*</span>
								</label>
								<div class="col-xs-4 col-md-4">
									<div class="dropdown">
										<select class="form-control" id="dll_Active">
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>
									</div>
								</div>
							</div>
							<div>



								<div class="row">
									<!--Category-->

									<div class="col-sm-5">
										<div class="form-group support-group">
											<label class="fontstyle" style="margin-left: 10px;">Available
												SubControls: </label> <br>
											<div class="list-group">
												<select class="form-control" style="margin-left: 10px;"
													multiple size="12" id="dll_Submenus">

												</select>
											</div>
										</div>
									</div>

									<!--fwd icon-->

									<div class="col-sm-2 fwd_icon">

										<center style="margin-top: 100px; margin-left: 20px;">
											<span class="glyphicon glyphicon-forward" id="btn_forward"
												data-backdrop="static" data-keyboard="false"></span>
										</center>
										<br>
										<br>

										<left style="margin-left:75px;"> <span
											class="glyphicon glyphicon-backward" aria-hidden="true"
											id="btn_reverse"></span> </left>
									</div>

									<!--Available types-->

									<div class="col-sm-5">
										<div class="form-group support-group">
											<label class="fontstyle" style="margin-left: -10px;">Selected
												SubControls: </label>
											<div class="list-group">
												<select class="form-control" multiple size="12"
													id="sel_attributes" style="margin-left: -10px;">
												</select>
											</div>
										</div>


									</div>


								</div>




								<div class="modal-footer" id="Footer">
									<button type="button" class="btn btn-danger" id="btn_save"
										data-dismiss="modal">Save</button>
									<button type="button" class="btn btn-default" id="btn_cancel"
										data-dismiss="modal">Cancel</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/scripts/Users/Users.js"
		type="text/javascript"></script>
</body>
</html>