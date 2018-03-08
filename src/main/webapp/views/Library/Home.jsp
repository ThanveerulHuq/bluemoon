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
<c:import url="/views/shared/_headerIncludes.jsp"></c:import>
<script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
</head>

<body style="overflow-y: hidden;">
	<jsp:include page="/views/shared/HomePageHeader.jsp" />
	<!-------- !Main content -------->
	<section class="container-fluid" id="main-content" style="padding-top:0px; overflow:auto">
						<div class="row">
						<div class="col-lg-2 padding-0">
							<div id="navigation-sidebar" class="affix-top" style="width: auto; top: auto; position:fixed">
								<ul class="nav nav-pills nav-stacked round" style="height: 530px; overflow-x: hidden;overflow-y:hidden;">
									 
								</ul>
							</div>
						</div>
							<!-- Hidden input-->
							<input type="hidden" name="contentid" value="" id="val_c_id" >
						<div class="col-lg-8 clearfix ">
						
						
						
						 </div>
						<!-------- !Sidebar navigation -------->
						 <div class="col-lg-2 pull-right " style="position:fixed;margin-left: 1140px;">
							<h4 class=" text-bolder" style="margin-left:13px;">Content</h4>
							<div id="right-sidebar" class="affix-top" style="width: auto; top: auto;">
								<ul class="nav ">
									
								</ul>
							</div>
						</div> 
					</div>
					</section>
					<br>
	<jsp:include page="/views/shared/_footer.jsp" />
	<!-- File  Upload Modal -->
	<div class="modal fade" id="FileUploadModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" style="opacity: 100" class="close" data-dismiss="modal" aria-hidden="true"> -->
<!-- <div class="badge badge-danger uppercase">Close</div> -->
<!-- 					</button> -->
<!-- 					<h4 class="modal-title">Upload File</h4> -->
<!-- 				</div> -->


<div class="modal-header row">
<div class="col-xs-10">
  <h4 class="modal-title">Upload File</h4></div>
<div class="col-xs-2">
<button type="button" class="btn btn-danger" id="btn_Close" data-dismiss="modal" style="margin-left: 5px;border-radius: 20px;">CLOSE
</button>
</div>
  
</div>
				<div class="modal-body">
					<!-- Body content -->
					<div class="panel-body form-horizontal">
						<!-- Query -->
						<div class="panel  panel-gray-dark">
							<div class="panel-body mtop-10">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group col-md-12">
											<label for="xlf" class="control-label">File Upload</label>
											<form class="form-horizontal" role="form" id="fileForm">
												<input type="file" class="form-control input-sm"
													id="inputfileupload" name="file" accept=".zip"
													placeholder="select upload Zip file.">
												<input type="hidden" name="contentid" value="" id="txt_c_id">
											</form>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="input-group-btn">
											<div class="btn-group" role="group"
												style="margin-left: 430px; padding-top: 10px;">
												<button type="button" id="btn_Upload"
													class="btn btn-danger" data-dismiss="modal">
													Upload
													<!-- <span class="glyphicon glyphicon-search" aria-hidden="true">Upload</span> -->
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
$('document').ready(function(){
		$('#admintab').click(function(){
			window.location = "Admin";
			return false;
		});
});
</script>
	<script
		src="<%=request.getContextPath()%>/resources/scripts/Library/Library.js"
		type="text/javascript"></script>
</body>

</html>