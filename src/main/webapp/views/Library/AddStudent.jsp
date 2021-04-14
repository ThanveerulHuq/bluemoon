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
	<form:form method="POST" action="/SDMS_2021/SaveStudent"
		commandName="StudentsInfo" class="mtop-25"
		enctype="multipart/form-data">
		<form:hidden path="studentId" name="studentId" id="studentId" />
		<div class="form-group col-md-12">
			<!-- 			<span class="pull-right" style="color:red">*</span> -->
			<label class="col-md-2"><span class="pull-right">Student
					Name:</span></label>
			<div class="col-md-3">
				<form:input path="name" class="form-control" required="true" type="text" maxlength="40" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Age:</span></label>
				<div class="col-md-3">
					<form:input path="age" class="form-control" type="number"
						required="true" maxlength="2"
						oninput="javascript: if (this.value.length > this.maxLength) showalert('length should not be more than'+this.maxLength,'error');this.value = this.value.slice(0, this.maxLength);" />
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
					oninput="javascript: if (this.value.length > this.maxLength) showalert('length should not be more than'+this.maxLength,'error');this.value = this.value.slice(0, this.maxLength);" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">EMIS
						Number:</span> </label>
				<div class="col-md-3">
					<form:input path="emisNo" class="form-control" type="number"
						required="true" maxlength="20"
						oninput="javascript: if (this.value.length > this.maxLength) showalert('length should not be more than'+this.maxLength,'error');this.value = this.value.slice(0, this.maxLength);" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Admission
					Number:</span> </label>
			<div class="col-md-3">
				<form:input path="admissionNo" name="admissionNo" class="form-control" required="true" type="number" maxlength="15"/>
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Admission
						Date:</span> </label>
				<div class="col-md-3">
					<form:input path="admissionDate" name="admissionDate"
						class="form-control" 
						required="true" id="admissionDate" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Community:</span>
			</label>
			<div class="col-md-3">
				<form:select path="community" class="form-control" id="community">
				<option value="-1">---SELECT---</option>
				<option value="BCM">BCM</option>
				<option value="BCM">BC</option>
				<option value="BCM">MBC</option>
				<option value="SC">SC</option>
				<option value="ST">ST</option>				
				</form:select>
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Religion:</span> </label>
				<div class="col-md-3">
					<form:input path="religion" class="form-control" type="text" maxlength="15"
						required="true" />
				</div>
			</div>
			
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Caste:</span>
			</label>
			<div class="col-md-3">
				<form:input path="caste" class="form-control" required="true" type="text" maxlength="30"/>
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Nationality:</span> </label>
				<div class="col-md-3">
					<form:input path="nationality" class="form-control" type="text" maxlength="15"
						required="true" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Mobile
					Number 1:</span> </label>
			<div class="col-md-3">
				<form:input path="mobileNo1" class="form-control" required="true" maxlength="15"
					type="number" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Mobile
						Number 2:</span> </label>
				<div class="col-md-3">
					<form:input path="mobileNo2" class="form-control" type="number" maxlength="15" required="true" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Father
					Name:</span> </label>
			<div class="col-md-3">
				<form:input path="fatherName" class="form-control" required="true" type="text" maxlength="40"/>
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Mother
						Name:</span> </label>
				<div class="col-md-3">
					<form:input path="motherName" class="form-control" type="text" maxlength="40" required="true" />
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Previous
					School:</span> </label>
			<div class="col-md-3">
				<form:input path="previousSchool" type="text" maxlength="100" class="form-control" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Mother
						Tongue:</span> </label>
				<div class="col-md-3">
					<form:input path="motherTongue" class="form-control" type="text" maxlength="10"
						required="true" />
				</div>
				
			</div>
		</div>
		<div class="form-group col-md-12">
			<label class="col-md-2"><span class="pull-right">Residential
					Address:</span> </label>
			<div class="col-md-3">
				<form:textarea path="address" class="form-control" required="true" maxlength="1000"
					style="height:90px" />
			</div>
			<div class="row">
				<label class="col-md-2"><span class="pull-right">Remarks:</span> </label>
				<div class="col-md-3">
					<form:textarea path="remarks" class="form-control" required="true" maxlength="100"
						style="height:90px" />
				</div>
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
				<button class="btn btn-info" type="button" id="addPhoto" onclick="addProfilePhoto()">
					<span class="glyphicon glyphicon-plus text-biggest"></span>Add
					Photo
				</button>
			</div>
			<!-- <div class="col-md-3"> 
				<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#addPhotoModel" onclick="takePhoto()">Add Photo</button>
			</div> -->
		</div>
		<div class="form-group col-md-12" id="doc_area">
					<c:forEach items="${StudentsInfo.fileNames}" var="name" varStatus="status">
							<div class="form-group col-md-12">
								<label class="col-md-2"><span class="pull-right">Document
										Name:</span></label>
								<div class="col-md-2">
									<legend name="${name}">${name}</legend>
								</div>
								<div class="col-md-1">
									<button class="btn btn-info" onclick="getFile('${StudentsInfo.fileIds[status.index]}')">Download</button>
								</div>
								<div class="col-md-1 mleft-10">
									<button class="btn btn-danger pull-left" onclick="removeMe(this,'${StudentsInfo.fileIds[status.index]}')">Remove</button>
								</div>
							</div>
					</c:forEach>
		</div>
		<div class="form-group col-md-12" id="document_area"></div>
		<div class="col-md-10">
			<div class="pull-right">
				<form:button type="button" class="btn btn-danger btn-md" 
					onclick="clearInput()">Reset</form:button>
				<form:button type="submit" class="btn btn-success" id="btn_submit"
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
		$('#admissionDate').datepicker({ dateFormat: 'yy-mm-dd' }).datepicker("setDate", new Date());
		//$('#dob').datepicker({ dateFormat: 'yy-mm-dd' })
		var dob="${StudentsInfo.dob}";
		var adm_date= "${StudentsInfo.admissionDate}";
		var gender="${StudentsInfo.gender}"
		var community = "${StudentsInfo.community}";
		var active="${StudentsInfo.active}"
		document.getElementById("dob").valueAsDate = formatDate(dob);
		$("admissionDate").val(formatDate(adm_date));
		if(gender != '' && active != '' && community != ''){
			$('#gender').val(gender);
			$('#active').val(active);
			$('#community').val(community);
		}
		if('${StudentsInfo.admissionNo}' == ''){
			$('#btn_submit').prop('disabled','true');
		}else{
// 			$('#admissionNo').prop('disabled','true');
		}
		if($('legend[name=profile_photo]').text()){
			$('#addPhoto').hide();
		}
		
		$('#admissionNo').change(function(){
			var adNo =$('#admissionNo').val();
			if(adNo!=''){
			$.ajax({
				url: 'studentbyAdNo?admissionNo='+adNo,
				method: 'GET',
				success: function(res){
					console.log(res);
					if(res=='not exist'){
						$('#btn_submit').removeAttr( "disabled" );
					}
				},
				error: function(res){
					console.log(res);
					showalert('server error please contact admin','error')
				}
			});
			}
		});
	});
	function formatDate(date){
		date=date.split(' ');
	let fmt_date=date[1]+' '+date[2]+' '+date[5];
	fmt_date = new Date(fmt_date);
	return fmt_date;
	}
	
	function validateForm(){
		if($('#gender').val() == '-1' ){
		event.preventDefault();
		showalert('please select a valid gender','error');
		return false;
		}	
		if($('#community').val() == '-1' ){
			event.preventDefault();
		showalert('please select a valid community','error');
		return false;
		}
		$('#admissionNo').removeAttr('disabled');
		}
	
	function clearInput(){
		$(':input').not('#gender').val('');
		$('#gender').val('-1');
		$('#active').val('Y');
		showalert('All fields cleared','warning')
	}
	
	function addDoc(){
		var html=`<div class="form-group col-md-12">
		<label class="col-md-2"><span class="pull-right">Document Type:</span></label>
		<div class="col-md-3">
		<input type="text" path="fileNames" class="inputFileName" name="fileNames" required="true">
	</div>
		<div class="col-md-3">
			<input type="file" path="images" name="images" multiple="multiple" accept="image/*" >
		</div>
		<div class="col-md-3">
		<button class="btn btn-danger pull-left" onclick="removeMe(this)">remove</button>
	</div>
	</div>`;
	$('#document_area').append(html);
	$('.inputFileName').change(function(){
		 if($(this).val().indexOf('profile_photo') != -1){
			 $(this).val('');
			 showalert("File name can't contain 'profile_photo'");
		 }
	 });
	}
	
	function addProfilePhoto(){
		var html=`<div class="form-group col-md-12">
		<label class="col-md-2"><span class="pull-right">Document Type:</span></label>
		<div class="col-md-3">
		<input type="text" path="fileNames" id="profilePhoto" name="fileNames" value="profile_photo" readonly="true">
	</div>
		<div class="col-md-3">
			<input type="file" path="images" name="images" multiple="multiple" accept="image/*" >
		</div>
		<div class="col-md-3">
		<button class="btn btn-danger pull-left" id="removePhoto" onclick="removeMe(this)">remove</button>
	</div>
	</div>`;
	$('#document_area').append(html);
	$('#addPhoto').hide();
	}
	
	function removeMe(el,docId){
		event.preventDefault();
		if(window.confirm("Do You want to delete the file")){
		$.ajax({
			url: 'deleteFile?docId='+docId,
			method: 'GET',
			success: function(res){
				console.log(res);
				console.log($(el).parent().parent().remove());
				if(!$('legend[name=profile_photo]').text()){
					$('#addPhoto').show();
				}
			},
			error: function(res){
				console.log(res);
				showalert('error deleting file','error');
			}
		});
		}
		
	}
	
	function getFile(docId){
		event.preventDefault();
		  var win = window.open('GetFile?docId='+docId, '_blank');
		  return false;
		}
	function remove(docId,elem){
		event.preventDefault();
		if(window.confirm("Do You want to delete the file")){
		$.ajax({
			url: 'deleteFile?docId='+docId,
			method: 'GET',
			success: function(res){
				console.log(res);
			},
			error: function(res){
				console.log(res);
				showalert('error deleting file','error');
			}
		});
		}
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