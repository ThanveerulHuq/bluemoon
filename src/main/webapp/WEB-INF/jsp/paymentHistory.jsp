<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html
PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Fee Payment</title>
    <c:import url="./shared/header_includes.jsp"></c:import>
</head>

<body>
<c:import url="./shared/header.jsp"></c:import>
<div class="content container mtop-50">
    <center>
        <h2>Fee Payment</h2>
    </center>

    <!-- 	<div class="searchStudentDialog mtop-15"> -->
    <%-- <form id="searchStudentForm"> --%>

    <!-- 	<div class="form-group col-md-12"> -->
    <!-- 		<label class="col-md-2"><span class="pull-right">Admission No:</span></label> -->
    <!-- 		<div class="col-md-3"> -->
    <!-- 			<input id="admissionNo" name="admissionNo" class="form-control" required="true" /> -->
    <!-- 		</div> -->
    <!-- 		<div class="col-md-2"> -->
    <!-- 			<div class="pull-left"> -->
    <!-- 				<button type="submit" class="btn btn-success">Search</button> -->
    <!-- 			</div> -->
    <!-- 		</div> -->
    <!-- 		</div> -->
    <!-- 		<label class="col-md-2"><span class="pull-right errMsgForAdmissionNo" style="color:red;display:none">Please enter valid admission number...</span></label> -->


    <%-- </form> --%>
    <!-- 	</div> -->

    <div class=" mtop-15" style="display:block">
        <div class="form-group col-md-12"><label class="col-md-2"><span
                class="pull-right">Academic Year:</span></label>
            <div class="col-md-2">
                <select name="academicYear" class="form-control" id="academicYear">
                    <c:forEach items="${academicYear}" var="year"
                               varStatus="status">
                        <option value="${year.id}">${year.year}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group col-md-12">
            <!-- 			<span class="pull-right" style="color:red">*</span> -->
            <!-- 				<label class="col-md-2"><span class="pull-right">Admission No:</span></label> -->
            <!-- 				<div class="col-md-3"> -->
            <!-- 					<input id="admissionIdFound" class="form-control" value="" readonly="true" /> -->
            <!-- 				</div> -->

            <div class="row">
                <label class="col-md-2"><span class="pull-right">Student
															Name:</span></label>
                <div class="col-md-3">
                    <select class="form-control" id="studentName"></select>
                </div>
                <label class="col-md-1 text-bigger"><span
                        class="pull-right">Class:</span> </label>
                <div class="col-md-1">
                    <legend class="text-bigger" id="className"></legend>
                </div>
                <label class="col-md-1 text-bigger"><span
                        class="pull-right">Section:</span> </label>
                <div class="col-md-1">
                    <legend class="text-bigger" id="section"></legend>
                </div>
            </div>
            <div class="row mtop-30">
                <label class="col-md-2"><span class="pull-right">Total Fee :</span></label>
                <div class="col-md-2">
                    <legend class="text-bigger" id="totalFee"></legend>
                </div>
                <div class="col-md-6">
                    <label class="col-md-4 text-bigger"><span
                            class="pull-right">Balance Fee:</span> </label>
                    <div class="col-md-3">
                        <legend class="text-bigger" id="balanceFee"></legend>
                </div>

            </div>
        </div>
        <div class="col-md-8 col-md-offset-1 mtop-50">
            <table class="table table-bordered">
                <tr>
                    <th class="col-md-1 text-center">
                        <h5>DATE</h5>
                    </th>
                    <th class="col-md-1 text-center">
                        <h5>AMOUNT PAID(INR)</h5>
                    </th>
                </tr>
                <tbody id="tbody">
                <tr>
                    <td colspan="2" class="text-center">NO DATA</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

<script type="text/javascript">

    $('document').ready(function () {
        $('#studentName').select2({
            ajax: {
                url: 'getAllStudentyearq',
                data: function (params) {
                    return {q: params.term, academicYear: $('#academicYear').val()}
                },
                dataType: 'json',
                processResults: function (data) {
                    var results = [];
                    for (index in data) {
                        results.push({
                            'id': data[index].id,
                            "text": data[index].studentsInfo.name + ',' + data[index].studentsInfo.fatherName,
                            "student": data[index]
                        })
                    }
                    return {
                        results: results
                    };
                }
            }
        });
        $('#studentName').on('select2:select', function (e) {
            const html = "<tr><td colspan='2' class='text-center'>Loading...</td></tr>";
            $('#tbody').html(html);
            $.ajax({
                url: '/SDMS/GetPaymentHistory?studentYearId=' + e.params.data.id,
                method: 'GET',
                success: function (res) {
                let html = '';
                if ( res.length == 0) {
                    html = "<tr><td colspan='2' class='text-center'>NO HISTORY</td></tr>"
                }
                for ( const feeTxn of res ) {
                    console.log(res);
                    html += '<tr>'
                    html += "<td class='text-center'>" + formatDate(feeTxn.paymentDate) +"</td>";
                    html += "<td> <p>" + feeTxn.amountPaid + "</td>"
                    html += "</tr>";
                }
                $('#tbody').html(html);

                },
                error: function () {
                    showalert('Server error please contact Admin', 'error');
                }
            });
            $('#studentYearId').val(e.params.data.id);
            setupSaveFeeForm(e.params.data.student)
        });

        function setupSaveFeeForm(data) {
            const paidFee = data.paidFee.schoolFee + data.paidFee.bookFee + data.paidFee.uniformFee + data.paidFee.islamicStudies + data.paidFee.vanFee;
            $('#totalFee').html('Rs. ' + data.total);
            $('#balanceFee').html('Rs. ' + (data.total - paidFee) );
            $('#className').html(data.commonFee.classInfo.className);
            $('#section').html(data.section);
            $('#admissionIdFound').val(data.studentsInfo.admissionNo);
            $('#studentName').val(data.studentsInfo.name);
            $('#studentYearId').val(data.id);
            $('#tot_tution').text(data.commonFee.schoolFee);
            $('#bal_tution').text(data.commonFee.schoolFee - data.paidFee.schoolFee);
            $('#tot_book').text(data.commonFee.bookFee);
            $('#bal_book').text(data.commonFee.bookFee - data.paidFee.bookFee);
            $('#tot_uniform').text(data.uniformFee);
            $('#bal_uniform').text(data.uniformFee - data.paidFee.uniformFee);
            $('#tot_islamic').text(data.islamicStudies);
            $('#bal_islamic').text(data.islamicStudies - data.paidFee.islamicStudies);
            $('#tot_van').text(data.vanFee);
            $('#bal_van').text(data.vanFee - data.paidFee.vanFee);
            $('#scholarship').text(data.scholorship);
            $('#total_fee').text(data.total);
            paidfee = data.paidFee.schoolFee + data.paidFee.bookFee + data.paidFee.uniformFee + data.paidFee.islamicStudies + data.paidFee.vanFee;
            $('#tot_balance').text(data.total - paidfee);
            $('#balance').val(data.balance);
        }

        /* 		$('#saveFeeForm').submit(function(event){
                    event.preventDefault();
                }); */

    });


    function validateForm() {
        $('#tot_paid').removeAttr('disabled');
    }

    function clearInput() {
        $(':input').val('');
        alert('All fields cleared');
        window.location.reload();
    }

    $('.fee-input').change(function () {
        computeTotal();
    });

    function computeTotal() {
        var total = 0;
        $('.fee-input').each(function () {
            if ($(this).val() != '') {
                total += parseInt($(this).val());
            }
        });
        $('#tot_paid').val(total);
    }

    function formatDate(paymentdate) {
        var date = new Date(paymentdate);
        return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();

    }

</script>
</body>

</html>
