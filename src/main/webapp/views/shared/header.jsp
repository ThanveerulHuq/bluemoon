<style>
.ui-jqgrid tr.jqgrow td{
    height: 3em !important;
}
body{
font-family: 'Open Sans', serif;
}
header .main-nav{
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: #009900;
	z-index: 100;
}
header .main-nav-scrolled{
	background-color: rgba(0,0,0,1);
}
.navbar-light .navbar-nav .nav-link{
	color: #fff;
}
.navbar-light .navbar-nav .active .nav-link{
	color: #00e0d0;
}

/*for test*/
/* body{
  height: 400px;
} */
.ml-auto{
list-style: none;
}
/* MARGIN */
.margin-0 {
  margin: 0px !important;
}
.mtop--5 {
  margin-top: -5px !important;
}
.mtop--10 {
  margin-top: -10px !important;
}
.mtop--15 {
  margin-top: -15px !important;
}
.mtop--20 {
  margin-top: -20px !important;
}
.mtop--25 {
  margin-top: -25px !important;
}
.mtop--30 {
  margin-top: -30px !important;
}
.mtop--35 {
  margin-top: -35px !important;
}
.mtop--40 {
  margin-top: -40px !important;
}
.mtop--45 {
  margin-top: -45px !important;
}
.mtop--50 {
  margin-top: -50px !important;
}
.mtop--55 {
  margin-top: -55px !important;
}
.mtop-0 {
  margin-top: 0px !important;
}
.mtop-5 {
  margin-top: 5px !important;
}
.mtop-10 {
  margin-top: 10px !important;
}
.mtop-15 {
  margin-top: 15px !important;
}
.mtop-20 {
  margin-top: 20px !important;
}
.mtop-25 {
  margin-top: 25px !important;
}
.mtop-30 {
  margin-top: 30px !important;
}
.mtop-35 {
  margin-top: 35px !important;
}
.mtop-40 {
  margin-top: 40px !important;
}
.mtop-45 {
  margin-top: 45px !important;
}
.mtop-50 {
  margin-top: 50px !important;
}
.mtop-55 {
  margin-top: 55px !important;
}
.mbottom--5 {
  margin-bottom: -5px !important;
}
.mbottom--10 {
  margin-bottom: -10px !important;
}
.mbottom--15 {
  margin-bottom: -15px !important;
}
.mbottom--20 {
  margin-bottom: -20px !important;
}
.mbottom--25 {
  margin-bottom: -25px !important;
}
.mbottom--30 {
  margin-bottom: -30px !important;
}
.mbottom--35 {
  margin-bottom: -35px !important;
}
.mbottom--40 {
  margin-bottom: -40px !important;
}
.mbottom--45 {
  margin-bottom: -45px !important;
}
.mbottom--50 {
  margin-bottom: -50px !important;
}
.mbottom-0 {
  margin-bottom: 0px !important;
}
.mbottom-5 {
  margin-bottom: 5px !important;
}
.mbottom-10 {
  margin-bottom: 10px !important;
}
.mbottom-15 {
  margin-bottom: 15px !important;
}
.mbottom-20 {
  margin-bottom: 20px !important;
}
.mbottom-25 {
  margin-bottom: 25px !important;
}
.mbottom-30 {
  margin-bottom: 30px !important;
}
.mbottom-35 {
  margin-bottom: 35px !important;
}
.mbottom-40 {
  margin-bottom: 40px !important;
}
.mbottom-45 {
  margin-bottom: 45px !important;
}
.mbottom-50 {
  margin-bottom: 50px !important;
}
.mleft-0 {
  margin-left: 0px !important;
}
.mleft-5 {
  margin-left: 5px !important;
}
.mleft-10 {
  margin-left: 10px !important;
}
.mleft-15 {
  margin-left: 15px !important;
}
.mleft-20 {
  margin-left: 20px !important;
}
.mleft-25 {
  margin-left: 25px !important;
}
.mleft-30 {
  margin-left: 30px !important;
}
.mleft-35 {
  margin-left: 35px !important;
}
.mleft-40 {
  margin-left: 40px !important;
}
.mleft-45 {
  margin-left: 45px !important;
}
.mleft-50 {
  margin-left: 50px !important;
}
.mright-0 {
  margin-right: 0px !important;
}
.mright-5 {
  margin-right: 5px !important;
}
.mright-10 {
  margin-right: 10px !important;
}
.mright-15 {
  margin-right: 15px !important;
}
.mright-20 {
  margin-right: 20px !important;
}
.mright-25 {
  margin-right: 25px !important;
}
.mright-30 {
  margin-right: 30px !important;
}
.mright-35 {
  margin-right: 35px !important;
}
.mright-40 {
  margin-right: 40px !important;
}
.mright-45 {
  margin-right: 45px !important;
}
.mright-50 {
  margin-right: 50px !important;
}

/* PADDING */
.padding-0 {padding: 0 !important;}
.padding-10{padding:10px 10px 10px 10px;}

.padtop-10{padding-top: 10px;}
.padtop-15{padding-top: 15px;}
.padtop-20{padding-top: 20px;}
.padtop-25{padding-top: 25px;}
.padtop-30{padding-top: 30px;}

.padbottom-15{padding-bottom: 15px;}
.padbottom-20{padding-bottom: 20px;}
.padbottom-25{padding-bottom: 25px;}
.padbottom-30{padding-bottom: 30px;}
.nav>li>a:focus, .nav>li>a:hover {
    background-color: #eee;
    color:rgb(0, 153, 0)!important;
}

</style>


<header>
       <nav class="navbar navbar-expand-lg navbar-light text-light main-nav">
          <div class="container" style="width:1330px!important;">
            <a class="navbar-brand padding-0" href="#"><img src="<%=request.getContextPath()%>/resources/images/scool_logo.png" width="45" alt="Logo"></a>
              <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button> -->
				<h3 class="col-md-5" style="color:white;width:38%;">DHAARUS SALAAM STUDENTS DATABASE</h3>
              <div class="collapse navbar-collapse nav navbar-nav navbar-right mtop-10" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto nav ">
                  <li class="nav-tab active" >
                    <a class="nav-link text-uppercase" href="/SDMS/StudentInfo">All Students <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-tab">
                    <a class="nav-link text-uppercase" href="/SDMS/CurrentStudents">Students by Year</a>
                  </li>
                  <li class="nav-tab">
                    <a class="nav-link text-uppercase" href="/SDMS/FeeTxn">Pay Fee</a>
                  </li>
                  <li class="nav-tab">
                    <a class="nav-link text-uppercase" href="/SDMS/StudentReport">Students Report</a>
                  </li>
                  <li class="nav-tab">
                    <a class="nav-link text-uppercase" href="/SDMS/FeeReport">Fee Report</a>
                  </li>
                  <li class="nav-tab">
                    <a class="nav-link text-uppercase" href="/SDMS/TutionFee">School Fee</a>
                  </li>
                </ul>
              </div>
          </div>
        </nav>
    </header>