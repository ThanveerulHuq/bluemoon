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
<title>Home</title>
<c:import url="/views/shared/header_includes.jsp"></c:import>
</head>
<body>
	<c:import url="/views/shared/header.jsp"></c:import>
	<section class="container mtop-50">
            <!-- ./Team member -->
            <!-- Team member -->
            <a href="/SDMS/StudentInfo">
            <div class="col-xs-12 col-sm-4 col-md-3" >
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/studentsInfo.png" alt="card image"></p>
                                    <h4 class="card-title">All Students Info</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">All Students Info </h4>
                                    <p class="card-text mtop-20">See All Students Details <br />New Admission</br>Students Profile Print</br>Download Student Documents</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <!-- ./Team member -->
            <!-- Team member -->
            <a href="/SDMS/CurrentStudents">
            <div class="col-xs-12 col-sm-4 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/studentyear.png" alt="card image"></p>
                                    <h4 class="card-title">Students By Academic Year</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Students By Academic Year</h4>
                                    <p class="card-text  mtop-20">See Students in Each Academic Year</br>Map student to a class </br>Define/change fees for students </p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <!-- ./Team member -->
            <!-- Team member -->
            <a href="/SDMS/FeeTxn">
            <div class="col-xs-12 col-sm-4 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/payfee.png" alt="card image"></p>
                                    <h4 class="card-title">Pay Fees</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Pay Fees</h4>
                                    <p class="card-text mtop-20">Pay fee</br> Print Receipts</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <!-- ./Team member -->
            <!-- Team member -->
             <a href="/SDMS/StudentReport">
            <div class="col-xs-12 col-sm-4 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/studentReport.png" alt="card image"></p>
                                    <h4 class="card-title">Fee Balance Report</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Fee Balance Report</h4>
                                    <p class="card-text mtop-20">Fee Balance report containing students balance in each fee split</p>
                     
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <!-- ./Team member -->
            <!-- Team member -->
              <a href="/SDMS/FeeReport">
            <div class="col-xs-12 col-sm-4 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/transactionreport.png" alt="card image"></p>
                                    <h4 class="card-title">Fee Transaction Report</h4>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Fee Transaction Report</h4>
                                    <p class="card-text mtop-20">Fee transaction reports by date</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
             <a href="/SDMS/TutionFee">
            <div class="col-xs-12 col-sm-4 col-md-3">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
<%--                                     <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/transactionreport.png" alt="card image"></p> --%>
                                    <p><img class=" img-fluid" src="<%=request.getContextPath()%>/resources/images/schoolfee.png" alt="card image"></p>
                                    <h4 class="card-title">Set Common Fee</h4>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Set Common Fee</h4>
                                    <p class="card-text mtop-20">Set school fee and book fee for classes on each academic year</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <!-- ./Team member -->
        </section>
		
	

	<script type="text/javascript">
	
	$('document').ready(function(){
	});
	</script>
</body>

</html>