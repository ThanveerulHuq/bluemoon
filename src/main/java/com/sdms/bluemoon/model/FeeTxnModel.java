package com.sdms.bluemoon.model;

import org.springframework.format.annotation.DateTimeFormat;

public class FeeTxnModel {

	private Long studentYearId;
	
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

	public Long getIslamicStudies() {
		return islamicStudies;
	}

	public void setIslamicStudies(Long islamicStudies) {
		this.islamicStudies = islamicStudies;
	}

	public Long getVanFee() {
		return vanFee;
	}

	public void setVanFee(Long vanFee) {
		this.vanFee = vanFee;
	}

	private Long schoolFee;
	
	private Long bookFee;

	private Long uniformFee;
	
	private Long islamicStudies;
	
	private Long vanFee;
	
	
	private Long amountPaid;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Long paymentDate;

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

}
