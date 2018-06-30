<style>


</style>


<header>
       <nav class="navbar navbar-expand-lg navbar-light text-light main-nav">
          <div class="container" style="width:1330px!important;">
            <a class="navbar-brand padding-0" href="/SDMS/Home"><img src="<%=request.getContextPath()%>/resources/images/scool_logo.png" width="45" alt="Logo"></a>
              <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button> -->
				  <a href="/SDMS/Home"><h3 class="col-md-5" style="color:white;width:38%;">A.R. Matriculation School</h3></a>
              <div class="collapse navbar-collapse nav navbar-nav navbar-right mtop-10" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto nav ">
                  <li class="nav-tab" >
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
<!--                   <li class="nav-tab"> -->
<!--                     <a class="nav-link text-uppercase" href="/SDMS/TutionFee">School Fee</a> -->
<!--                   </li> -->
                  <li class="nav-tab">
                    <a class="nav-link text-uppercase" href="/SDMS/Logout"><img src="<%=request.getContextPath()%>/resources/images/logout.png" width="25" alt="Logout"></a>
                  </li>
                </ul>
              </div>
          </div>
        </nav>
    </header>
    <script>
    function showalert(message,type) {
    	new PNotify({
    	     title: message,
    	     text: "",
    	     addclass: "stack-custom",
    	     type: type,
    	     delay: 4000,
    	     stack: {"dir1":"down", "dir2":"left", "push":"top"},
    	     buttons: {sticker: false} 
    	    });
    	
      }
    
    
    </script>