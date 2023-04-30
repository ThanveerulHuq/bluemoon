package com.sdms.bluemoon.model;

import org.springframework.format.annotation.DateTimeFormat;

public class FeeTxnModel {

    private Long studentYearId;
    private Long schoolFee;
    private Long bookFee;
    private Long uniformFee;
    private Long vanFee;
    private Long amountPaid;
    private String remarks;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Long paymentDate;

    public Long getSchoolFee() {
        return schoolFee;
    }

    public void setSchoolFee(Long schoolFee) {
        this.schoolFee = schoolFee;
    }

    public Long getBookFee() {
        return bookFee;
    }

    public void setBookFee(Long bookFee) {
        this.bookFee = bookFee;
    }

    public Long getUniformFee() {
        return uniformFee;
    }

    public void setUniformFee(Long uniformFee) {
        this.uniformFee = uniformFee;
    }

    public Long getVanFee() {
        return vanFee;
    }

    public void setVanFee(Long vanFee) {
        this.vanFee = vanFee;
    }

    public Long getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Long amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Long getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Long paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Long getStudentYearId() {
        return studentYearId;
    }

    public void setStudentYearId(Long studentYearId) {
        this.studentYearId = studentYearId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
