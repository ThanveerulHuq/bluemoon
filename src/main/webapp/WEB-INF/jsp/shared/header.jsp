<style>


</style>


<header>
    <nav class="navbar navbar-expand-lg navbar-light text-light main-nav">
        <div class="container" style="width:1330px!important;">
            <a class="navbar-brand padding-0" href="<%=request.getContextPath()%>/Home"><img
                    src="<%=request.getContextPath()%>/images/scool_logo.png" width="45" alt="Logo"></a>
            <a href="/SDMS/Home">
                <h3 class="col-md-5" style="color:white;width:40%;">DHAARUS SALAAM STUDENTS DATABASE</h3>
            </a>
            <div class="collapse navbar-collapse nav navbar-nav navbar-right mtop-10" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto nav ">
                    <li class="nav-tab">
                        <a class="nav-link text-uppercase" href="<%=request.getContextPath()%>/StudentInfo">All Students</a>
                    </li>
                    <li class="nav-tab">
                        <a class="nav-link text-uppercase" href="<%=request.getContextPath()%>/CurrentStudents">Students by Year</a>
                    </li>
                    <li class="nav-tab">
                        <a class="nav-link text-uppercase" href="<%=request.getContextPath()%>/FeeTxn">Pay Fee</a>
                    </li>
                    <li class="nav-tab">
                        <a class="nav-link text-uppercase" href="<%=request.getContextPath()%>/StudentReport">Students Report</a>
                    </li>
                    <li class="nav-tab">
                        <a class="nav-link text-uppercase" href="<%=request.getContextPath()%>/FeeReport">Fee Report</a>
                    </li>
                    <!--                   <li class="nav-tab"> -->
                    <!--                     <a class="nav-link text-uppercase" href="/SDMS/TutionFee">School Fee</a> -->
                    <!--                   </li> -->
                    <li class="nav-tab">
                        <a class="nav-link text-uppercase" href="<%=request.getContextPath()%>/Logout"><img
                                src="<%=request.getContextPath()%>/images/logout.png" width="25" alt="Logout"></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script>
    function showalert(message, type) {
        new PNotify({
            title: message,
            text: "",
            addclass: "stack-custom",
            type: type,
            delay: 4000,
            stack: { "dir1": "down", "dir2": "left", "push": "top" },
            buttons: { sticker: false }
        });

    }

    $(function() {
        $('.nav- a[href^="<%=request.getContextPath()%>/' + location.pathname.split("/")[2] + '"]').parent().addClass('active');
        console.log('.nav-tab a[href^="<%=request.getContextPath()%>/' + location.pathname.split("/")[2] + '"]')
    });


</script>