<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>SDMS Login</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
<style type="text/css">
	body {
	  background-color:#fff;
	  -webkit-font-smoothing: antialiased;
	  font: normal 14px Roboto,arial,sans-serif;
	}
	
	.loginContainer {
	    padding: 25px;
	    position: fixed;
	    margin-top: 150px;
	}
	
	.form-login {
	    background-color: #EDEDED;
	    padding-top: 10px;
	    padding-bottom: 20px;
	    padding-left: 20px;
	    padding-right: 20px;
	    border-radius: 15px;
	    border-color:#d2d2d2;
	    border-width: 5px;
	    box-shadow:0 1px 0 #cfcfcf;
	}
	
	h4 { 
	 border:0 solid #fff; 
	 border-bottom-width:1px;
	 padding-bottom:10px;
	 text-align: center;
	}
	
	.form-control {
	    border-radius: 10px;
	}
	
	.wrapper {
	    text-align: center;
	}

</style>
</head>
<body>
<c:import url="/views/shared/header.jsp"></c:import>
<div class="loginContainer container">
    <div class="row">
        <div class="col-md-offset-5 col-md-4">
            <div class="form-login">
            <h4>Login</h4>
            <form id="loginForm">
            <input type="text" id="username" class="form-control input-sm chat-input" placeholder="Username" required="true"/>
            </br>
            <input type="password" id="password" class="form-control input-sm chat-input" placeholder="Password" required="true"/>
            </br>
            <div style="text-align:center">
            	<span class="errMsg" style="display:none;color:red;">Username or Password Incorrect</span>
            </div>
            </br>
            <div class="wrapper">
            </form>
            <span class="group-btn">     
                <button type="submit" id="loginSubmit" class="btn btn-primary btn-md">Submit</button>
            </span>
            </div>
            </div>
        
        </div>
    </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.nav').hide();
		$('#loginForm').submit(function(e){
			e.preventDefault();
			var uname = $('#username').val();
			var pass = $('#password').val();
/* 			if(uname == 'admin' && pass == 'admin') {
				$('.errMsg').hide();
				window.location = "/SDMS_2020/Home";
			} else {
				$('.errMsg').show();
				$('input').val('');
			} */
			$.ajax({
				url:'/SDMS_2020/GetLogin',
				data: {'username' : uname, 'password': pass},
				method: 'POST',
				success: function(res){
					if(res == 'SUCCESS') {
						$('.errMsg').hide();
						window.location = "/SDMS_2020/Home";
					} else {
						$('.errMsg').show();
						$('input').val('');
					}
				},
				error : function(){
					showalert('Server error please contact Admin','error');
				}
			});
			return false;
		});
	});

</script>
</body>
</html>