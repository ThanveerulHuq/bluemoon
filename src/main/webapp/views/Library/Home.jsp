<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Student Log</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<section class="container mtop-50">
	<center>
		<h2>Admission Form</h2>
	</center>
	<form:form method="POST" action="/SDMS/SaveStudent"
		commandName="StudentsInfo" class="mtop-25"
		enctype="multipart/form-data">
		<form:hidden path="studentId" name="studentId" id="studentId" />
		<div class="form-group col-md-12">
			<!-- 			<span class="pull-right" style="color:red">*</span> -->
			<label class="col-md-2"><span class="pull-right">Student
					Name:</span></label>
			<div class="col-md-3">
				<form:input path="name" class="form-control" required="true" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Age:</span></label>
				<div class="col-md-3">
					<form:input path="age" class="form-control" type="number"
						required="true" maxlength="2"
						oninput="javascript: if (this.value.length > this.maxLength) alert('length should not be more than'+this.maxLength);this.value = this.value.slice(0, this.maxLength);" />
				</div>
			</div>

		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Gender:</span>
			</label>
			<div class="col-md-3">
				<form:select path="gender" class="form-control"
					value="${StudentsInfo.gender}">
					<option value="-1">SELECT</option>
					<option value="M">Male</option>
					<option value="F">Female</option>
				</form:select>
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Date
						of Birth:</span> </label>
				<div class="col-md-3">
					<form:input path="dob" name="dob" class="form-control" type="Date"
						pattern="MM-dd-yyyy" required='true'
						value="<fmt:formatDate value='${StudentsInfo.dob}' pattern='yyyy-MM-dd'/>" />
				</div>
			</div>

		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Aadhar
					Number:</span> </label>
			<div class="col-md-3">
				<form:input path="aadharNo" class="form-control" type="number"
					required="true" maxlength="12"
					oninput="javascript: if (this.value.length > this.maxLength) alert('length should not be more than'+this.maxLength);this.value = this.value.slice(0, this.maxLength);" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">EMIS
						Number:</span> </label>
				<div class="col-md-3">
					<form:input path="emisNo" class="form-control" type="number"
						required="true" maxlength="15"
						oninput="javascript: if (this.value.length > this.maxLength) alert('length should not be more than'+this.maxLength);this.value = this.value.slice(0, this.maxLength);" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Admission
					Number:</span> </label>
			<div class="col-md-3">
				<form:input path="admissionNo" class="form-control" required="true" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Admission
						Date:</span> </label>
				<div class="col-md-3">
					<form:input path="admissionDate" name="admissionDate"
						class="form-control" type="Date" pattern="YYYY-MM-DD"
						required="true" id="admissionDate" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Community:</span>
			</label>
			<div class="col-md-3">
				<form:input path="community" class="form-control" required="true" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Mother
						Tongue:</span> </label>
				<div class="col-md-3">
					<form:input path="motherTongue" class="form-control"
						required="true" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Mobile
					Number 1:</span> </label>
			<div class="col-md-3">
				<form:input path="mobileNo1" class="form-control" required="true"
					type="number" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Mobile
						Number 2:</span> </label>
				<div class="col-md-3">
					<form:input path="mobileNo2" class="form-control" type="number" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Father
					Name:</span> </label>
			<div class="col-md-3">
				<form:input path="fatherName" class="form-control" required="true" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Mother
						Name:</span> </label>
				<div class="col-md-3">
					<form:input path="motherName" class="form-control" required="true" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Previous
					School:</span> </label>
			<div class="col-md-3">
				<form:input path="previousSchool" class="form-control" />
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Residential
					Address:</span> </label>
			<div class="col-md-5">
				<form:textarea path="address" class="form-control" required="true"
					style="height:90px" />
			</div>
		</div>
		<input type="file" path="images" name="images" multiple="multiple"
			accept="image/*" style="display: none;">
			<input type="text" path="fileNames" name="fileNames" style="display: none;">
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Active
					Status:</span> </label>
			<div class="col-md-3">
				<form:select path="active" name="active" class="form-control"
					id="active" value="${StudentsInfo.active}">
					<option value="Y">Active</option>
					<option value="N">In-Active</option>
				</form:select>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Documents:</span>
			</label>
			<div class="col-md-3">
				<button class="btn btn-info" type="button" onclick="addDoc()">
					<span class="glyphicon glyphicon-plus text-biggest"></span>Add
					Document
				</button>
			</div>
			<div class="col-md-3"> 
				<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#addPhotoModel" onclick="takePhoto()">Add Photo</button>
			</div>
		</div>
		<div class="form-group col-md-12" id="doc_area">
					<c:forEach items="${StudentsInfo.fileNames}" var="name" varStatus="status">
							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Document
										Name:</span></label>
								<div class="col-md-2">
									<legend>${name}</legend>
								</div>
								<div class="col-md-1">
									<button class="btn btn-info" onclick="getFile('${StudentsInfo.fileIds[status.index]}')">Download</button>
								</div>
								<div class="col-md-1">
									<button class="btn btn-danger pull-left" onclick="removeMe(this)">Remove</button>
								</div>
							</div>
					</c:forEach>
		</div>
		<div class="form-group col-md-12" id="document_area"></div>
		<div class="col-md-10">
			<div class="pull-right">
				<form:button type="button" class="btn btn-danger btn-md"
					onclick="clearInput()">Reset</form:button>
				<form:button type="submit" class="btn btn-success"
					onclick="validateForm()">Submit</form:button>
			</div>
		</div>
	</form:form> 
	</section>
	
	<div id="addPhotoModel" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close closeStream" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Photo</h4>
				</div>
				<div class="modal-body">
				<video id="video"></video>
				<canvas id="photoCanvas" style="display:none;"></canvas>
				<div id="buttoncontent">
				</div>
				<button id="startbutton" class="btn btn-info">CAPTURE</button>
					</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-default closeStream" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container" style="margin-top: 25px;">
		<div class="row">
			<legend></legend>
			<p>
				<span class="pull-right"><a href="#">Privacy</a> |</span>
			</p>
		</div>
	</div>

	<script type="text/javascript">
	
	$('document').ready(function(){
		var dob="${StudentsInfo.dob}";
		var adm_date= "${StudentsInfo.admissionDate}";
		var gender="${StudentsInfo.gender}"
		var active="${StudentsInfo.active}"
		document.getElementById("dob").valueAsDate = formatDate(dob);
		document.getElementById("admissionDate").valueAsDate = formatDate(adm_date);
		if(gender != '' && active != ''){
		$('#gender').val(gender);
		$('#active').val(active);
		}
	})
	function formatDate(date){
		date=date.split(' ');
	let fmt_date=date[1]+' '+date[2]+' '+date[5];
	fmt_date = new Date(fmt_date);
	return fmt_date;
	}
	function validateForm(){
		if($('#gender').val() == '-1'){
			event.preventDefault();
		alert('please select a valid gender');
		return false;
		}	
		}
	function clearInput(){
		$(':input').not('#gender').val('');
		$('#gender').val('-1');
		$('#active').val('Y');
		alert('All fields cleared')
	}
	function addDoc(){
		var html=`<div class="form-group col-md-12">
		<label class="col-md-2"><span class="pull-right">Document Type:</span></label>
		<div class="col-md-3">
		<input type="text" path="fileNames" name="fileNames" required="true">
	</div>
		<div class="col-md-3">
			<input type="file" path="images" name="images" multiple="multiple" accept="image/*" >
		</div>
		<div class="col-md-3">
		<button class="btn btn-danger pull-left" onclick="removeMe(this)">remove</button>
	</div>
	</div>`;
	$('#document_area').append(html);
	}
	function removeMe(el){
		console.log($(el).parent().parent().remove());
	}
	
	function getFile(docId) {
		event.preventDefault();
		$.ajax({
			url: 'GetFile?docId='+docId,
			method: 'GET',
			success: function(res){
			},
			error: function(res){
				console.log(res);
				alert('There was an issue downloading the file. Contact Admin.')
			}
		});
	}
	
	var localstream;
	
	function takePhoto() 
	{
	  	var streaming = false,
	    video = document.querySelector('#video'),
	    canvas = document.querySelector('#photoCanvas'),
	    buttoncontent = document.querySelector('#buttoncontent'),
	    photo = document.querySelector('#photo'),
	    startbutton = document.querySelector('#startbutton'),
	    width = 320,
	    height = 0;

	  navigator.getMedia = (navigator.getUserMedia ||
	    navigator.webkitGetUserMedia ||
	    navigator.mozGetUserMedia ||
	    navigator.msGetUserMedia);

	  navigator.getMedia({
	      video: true,
	      audio: false
	    },
	    function(stream) {
	      if (navigator.mozGetUserMedia) {
	        video.mozSrcObject = stream;
	      } else {
	        var vendorURL = window.URL || window.webkitURL;
	        video.src = vendorURL.createObjectURL(stream);
	      }
	      localstream = stream;
	      video.play();
	    },
	    function(err) {
	      console.log("An error occured! " + err);
	    }
	  );

	  video.addEventListener('canplay', function(ev) {
	    if (!streaming) {
	      height = video.videoHeight / (video.videoWidth / width);
	      video.setAttribute('width', width);
	      video.setAttribute('height', height);
	      canvas.setAttribute('width', width);
	      canvas.setAttribute('height', height);
	      streaming = true;
	    }
	  }, false);

	  function takepicture() {
	  	video.style.display = "none";
	    canvas.style.display = "block";
	    startbutton.innerText= "RETAKE";
	  	canvas.width = width;
	    canvas.height = height;
	    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
	    var data = canvas.toDataURL('image/png');
	    photo.setAttribute('src', data);
	  }

	  startbutton.addEventListener('click', function(ev) {
	  	if(startbutton.innerText==="CAPTURE")
	    {
	    	takepicture();
	    }
	    else
	    {
	    	video.style.display = "block";
	    	canvas.style.display = "none";
	      startbutton.innerText= "CAPTURE";
	    }
	    ev.preventDefault();
	  }, false);
	}
	
	$('.closeStream').on('click', function() {
		  video.pause();
		  video.src = "";
		  localstream.getTracks()[0].stop();
	});
	</script>
</body>

</html>