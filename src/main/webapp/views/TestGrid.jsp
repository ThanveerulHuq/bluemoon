<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pick Release</title>
    
    
    <!-- jQuery UI for Datepicker -->
    <link href="https://storage.googleapis.com/sanm_ui_standard/v6/css/jquery-ui.min.css" rel="stylesheet">
    
    
    <!-- Bootstrap css -->
    <link href="https://storage.googleapis.com/sanm_ui_standard_dev/v6/css/sanmstyle.css" rel="stylesheet">
    
     <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:600" rel="stylesheet">
    <!-- Jquery js v3.2.1 -->
    <script src="https://storage.googleapis.com/sanm_ui_standard/v6/js/jquery-3.2.1.min.js"></script>
    
    <!-- Jquery ui v1.12.1 -->
    <script src="https://storage.googleapis.com/sanm_ui_standard/v6/js/jquery-ui.min.js"></script> 
    <!-- Local-en js-->
	<script src="https://storage.googleapis.com/sanm_ui_standard/v6/js/grid.locale-en.js" type="text/javascript"></script>
	<!-- Jqgrid js v5.0.0-->
	<link href="https://storage.googleapis.com/sanm_ui_standard/v6/css/sanmui.jqgrid.css" rel="stylesheet" type="text/css">
	<!-- Jqgrid css v5.0.0-->
	<script src="https://storage.googleapis.com/sanm_ui_standard/v6/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    
    <style type="text/css">
    .wizard {
    margin: 0px auto;
    background: #fff;
}

    .wizard .nav-tabs {
        position: relative;
        margin: 5px auto;
        margin-bottom: 0;
        border-bottom-color: #e0e0e0;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

.connecting-line {
    height: 2px;
    background: #e0e0e0;
    position: absolute;
    width: 70%;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 50%;
    z-index: 1;
}

.wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
    color: #555555;
    cursor: default;
    border: 0;
    border-bottom-color: transparent;
}

span.round-tab {
    width: 70px;
    height: 70px;
    line-height: 70px;
    display: inline-block;
    border-radius: 100px;
    background: #fff;
    border: 2px solid #e0e0e0;
    z-index: 2;
    position: absolute;
    left: 0;
    text-align: center;
    font-size: 25px;
}
span.round-tab i{
    color:#555555;
}
.wizard li.active span.round-tab {
    background: #fff;
    border: 2px solid #5bc0de;
    
}
.wizard li.active span.round-tab i{
    color: #5bc0de;
}

span.round-tab:hover {
    color: #333;
    border: 2px solid #333;
}

.wizard .nav-tabs > li {
    width: 33%;
}

.wizard li:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 0;
    margin: 0 auto;
    bottom: 0px;
    border: 5px solid transparent;
    border-bottom-color: #5bc0de;
    transition: 0.1s ease-in-out;
}

.wizard li.active:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 1;
    margin: 0 auto;
    bottom: 0px;
    border: 10px solid transparent;
    border-bottom-color: #5bc0de;
}

.wizard .nav-tabs > li a {
    width: 70px;
    height: 70px;
    margin: 20px auto;
    border-radius: 100%;
    padding: 0;
}

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

.wizard .tab-pane {
    position: relative;
    padding-top: 50px;
}

.wizard h3 {
    margin-top: 0;
}
.search .row {
    margin-bottom:10px;
}
.step_21 {
    border :1px solid #eee;
    border-radius:5px;
    padding:10px;
}
.step33 {
    border:1px solid #ccc;
    border-radius:5px;
    padding-left:10px;
    margin-bottom:10px;
}
.dropselectsec {
    width: 68%;
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    outline: none;
    font-weight: normal;
}
.dropselectsec1 {
    width: 74%;
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    outline: none;
    font-weight: normal;
}
.mar_ned {
    margin-bottom:10px;
}
.wdth {
    width:25%;
}
.birthdrop {
    padding: 6px 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: #333;
    margin-left: 10px;
    width: 16%;
    outline: 0;
    font-weight: normal;
}


/* according menu */
#accordion-container {
    font-size:13px
}
.accordion-header {
    font-size:13px;
	background:#ebebeb;
	margin:5px 0 0;
	padding:7px 20px;
	cursor:pointer;
	color:#fff;
	font-weight:400;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px
}
.unselect_img{
	width:18px;
	-webkit-user-select: none;  
	-moz-user-select: none;     
	-ms-user-select: none;      
	user-select: none; 
}
.active-header {
	-moz-border-radius:5px 5px 0 0;
	-webkit-border-radius:5px 5px 0 0;
	border-radius:5px 5px 0 0;
	background:#F53B27;
}
.active-header:after {
	content:"\f068";
	font-family:'FontAwesome';
	float:right;
	margin:5px;
	font-weight:400
}
.inactive-header {
	background:#333;
}
.inactive-header:after {
	content:"\f067";
	font-family:'FontAwesome';
	float:right;
	margin:4px 5px;
	font-weight:400
}
.accordion-content {
	display:none;
	padding:20px;
	background:#fff;
	border:1px solid #ccc;
	border-top:0;
	-moz-border-radius:0 0 5px 5px;
	-webkit-border-radius:0 0 5px 5px;
	border-radius:0 0 5px 5px
}
.accordion-content a{
	text-decoration:none;
	color:#333;
}
.accordion-content td{
	border-bottom:1px solid #dcdcdc;
}



@media( max-width : 585px ) {

    .wizard {
        width: 90%;
        height: auto !important;
    }

    span.round-tab {
        font-size: 16px;
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard .nav-tabs > li a {
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 35%;
    }
}
</style>
    
  
</head>
<body>
<!-------------------- ///////////////// Navigation //////////////////// ---------------------------->

<div class="navbar-wrapper">   
<!-------------------- /////////////////  Primary nav bar starts //////////////////// ---------------------------->  
<nav class="navbar navbar-static-top  navbar-default margin-0 col-xs-12 " role="navigation" style="background-color: white;margin-bottom:0;">

	    	<!-- Brand and toggle get grouped for better mobile display -->
            <div class="container-fluid padding-0">
	    		<div class=" col-lg-7 col-md-7 col-sm-6 col-xs-10 padding-0 margin-0">
                 <div class="col-lg-6 col-xs-12 col-sm-6 padding-0">
	    		  <a href="" class="btn padding-0 pull-left" target="_blank"> <img src="https://storage.googleapis.com/sanm_ui_standard/v6/images/App_Store_Logo.png" width="35" style="opacity: 1;" class="navbar-btn"></a>
			      <a class="navbar-brand uppercase appname" href="/index.html" style="margin-left: 0px;">
			     Application name 
			      </a>
                </div>
                     <!-- <div class="col-lg-3 col-sm-4 pull-left navbar-brand text-uppercase text-normal-size hidden-xs hidden-sm">
                    <p><span class="uppercase text-smallest pull-right badge badge-primary hidden-sm ">User testing</span></p>
                </div> -->
<!--
                 <div class="col-xs-2 pull-left navbar-brand text-uppercase text-normal-size  hidden-lg hidden-md">
                    <p><span class="uppercase text-smallest pull-right badge sanm-badge-primary hidden-lg">UAT</span></p>
                </div> 
-->
	    		</div>
                

	    		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-2 pull-right padding-0">
                    <div class="btn pull-right logo padding-0">
	    		<div class="pull-right dropdown ">
                <a href="#" data-toggle="dropdown"> 
			    	<img src="https://storage.googleapis.com/sanm_ui_standard/v6/images/User.png" alt="User profile picture" class="img-circle navbar-btn" style="height: 35px; width:35px"></a>
  
				            <ul class="dropdown-menu mtop:2" role="menu" style="margin-top: 8px;">
				                <li><a href="#">Action</a></li>
				                <li><a href="#">Another action</a></li>
				                <li><a href="#">Something else here</a></li>
				                <li class="divider"></li>
				                <li><a href="#">Separated link</a></li>
				                <li class="divider"></li>
				                <li>  <button type="button" class="col-lg-12 col-md-12 col-xs-12 btn btn-danger btn-cons">Logout</button> </li>
				              </ul> 
		    	</div>
	    	</div>
                    <small class="navbar-brand pull-right hidden-xs" >username@sanmina.com</small>
	    		</div>

			    
	    	</div>       
    
</nav>
    
<!-------------------- /////////////////  Secondary nav bar starts //////////////////// ---------------------------->   
<nav class="navbar navbar-static-top shrink navbar-inverse sanm-navbar-inverse mtop-0 col-xs-12 padding-0 affix-top" id="navigation-b" style="top:0px;z-index: 109;margin-bottom:0px;">
        <div class="container col-lg-12 col-sm-12 col-md-12 margin-0">
    
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    
                    
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                    
                    
                </button>
            <a class="navbar-brand hidden-sm hidden-md hidden-lg active" href="#">Pending Request</a></div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="col-lg-11 col-md-9 navbar-collapse collapse" id="bs-example-navbar-collapse-1" aria-expanded="false" style="height: 1px;">
                <ul class="nav navbar-nav navbar-left">
                   
                    <li id="activeTab" class="active">
                        <a href="#portfolio" class="active">Landing page</a>
                    </li>
                   <li class="dropdown">
										              <a href="#" class="dropdown-toggle" data-toggle="dropdown">More tabs <b class="caret"></b></a>
										              <ul class="dropdown-menu" role="menu">
										                <li><a href="#">Action</a></li>
										                <li><a href="#">Another action</a></li>
										                <li><a href="#">Something else here</a></li>
										                <li class="divider"></li>
										                <li><a href="#">Separated link</a></li>
										                <li class="divider"></li>
										                <li><a href="#">One more separated link</a></li>
										              </ul>
										            </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            
        <div class="padding-0 backtotop">
			    		<a href=".navbar-wrapper" id="btn-gotop" class="btn btn-gray-light btn-lg navbar-btn-lg pull-right hide show-on-affixed">
					      		<span class="glyphicon glyphicon-chevron-up"></span>
					      	</a>
			    	</div> 
                    
        </div>
        <!-- /.container-fluid -->
</nav>
</div>
   
<!-------------------- ///////////////// Section //////////////////// ---------------------------->
<section class=" " id="main-content" style="background-color:white;">
<div class="container">
    <div class="row">
    	<section>
        <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="">
                        <a href="/Library/PickRelease"   role="tab" title="Search"  data-placement="bottom" >
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-search mtop-20"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="active">
                        <a href="#pick" data-toggle="tab" aria-controls="pick" role="tab" title="Pick"  data-placement="bottom">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-pencil mtop-20"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#ViewStatus" data-toggle="tab" aria-controls="ViewStatus" role="tab" title="View Status"  data-placement="bottom">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok mtop-20"></i>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

                <div class="tab-content">
                    <div class="tab-pane " role="tabpanel" id="search"></div>

					<div class="tab-pane active" role="tabpanel" id="pick"
						style="padding-top: 2px;">
						<div class="pick">
							<div class="grid-items" style="width: 100%; height: 400px;">
								<table id="Grid"></table>
								<div id="Pager"></div>
							</div>
						</div>
						<ul class="list-inline pull-right">
							<li><button type="button" class="btn btn-default prev-step">Previous</button></li>
							<li><button type="button" class="btn btn-primary next-step">Save
									and continue</button></li>
						</ul>
					</div>
					<div class="tab-pane" role="tabpanel" id="ViewStatus">
                        <div class="step44">
                            <h5>Completed</h5>
                            
                          
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
        </div>
    </section>
   </div>
</div>

</section>
       
<!-------------------- /////////////////  Footer //////////////////// ---------------------------->
<footer class=" col-lg-12 sanm-footer ">
    	<div class="container-fluid">
		      <div class="row">
			      <div class="col-xs-12">
				      <b>Baseline project@2018</b>
                      <div class="badge badge-danger uppercase mtop-5 mbottom-5 mleft-5 mright-5">Version 1</div>
				      <img src="http://code.sanmina.com/v4/img/logos/sanmina-white-85x48.png" width="50" alt="Sanmina" class="pull-right ">
                  </div>
		      </div>
    	</div>    
  	</footer>  
    
    
     
    
    <!-- Bootstrap js v3.3.7 -->
    <script src="https://storage.googleapis.com/sanm_ui_standard/v6/js/bootstrap.min.js"></script> 
    
    <!-- Sanmcomponents js-->
<!--     <script src="https://storage.googleapis.com/sanm_ui_standard/v6/js/sanm-components.js"></script>  -->
<script type="text/javascript">$(document).ready(function () {
    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();
    
   /*  //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);
    
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);

    });
    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    }); */
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

$('document').ready(
function () {
'use strict';
var grid=$("#Grid");
grid.jqGrid({
url:"http://localhost:8080/Library/getAllControlSubMenu",
colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
colModel:[
{name:'csm_id',index:'id', width:60, sorttype:"int",search: false, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
{name:'created_date',index:'invdate', width:190, sorttype:"date", formatter:"date", searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
{name:'modified_by',index:'name', width:200 ,searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
{name:'created_by',index:'amount', width:180, align:"right",sorttype:"float", formatter:"number", searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
{name:'tax',index:'tax', width:180, align:"right",sorttype:"float", searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
{name:'total',index:'total', width:180,align:"right",sorttype:"float", searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
{name:'note',index:'note', width:200, sortable:false, searchoptions: { sopt: ['bw','cn','eq', 'ew']}}
],

search:true,
pager: '#Pager',
pageable: true,
jsonReader:{cell:""},
rowNum: 100,
rowList: [50,100,200],
viewrecords: true,
height: $(".grid-items").height() - 100,
width:$(".grid-items").width(),


datatype:"json",
shrinkToFit: true,
multiselect: false,
autowidth: false,
scroll: 1,
gridview: true,
scrollOffset: 0,
altRows:true,
altclass:'altrow',
rownumbers:true,
scrollPopUp:true,
emptyrecords: 'Scroll to bottom to retrieve new page'

});




$("#Grid").jqGrid('navGrid','#Pager', {
view: false, del: false, add: false, edit: false, cloneToTop: false,search:false,refresh:true},

{}, {}, // default settings for add
{}, // delete
{
}).navSeparatorAdd('#Pager');
jQuery("#Grid").jqGrid('filterToolbar',{searchOperators : true});
$('#refresh_Grid div').append("<span>Reload</span>");
$('INPUT[id^="gs_"]').addClass('form-control input-sm');


});


</script>
    
    
</body>
</html>
