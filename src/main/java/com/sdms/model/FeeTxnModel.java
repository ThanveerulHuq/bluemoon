package com.sdms.model;

import org.springframework.format.annotation.DateTimeFormat;

public class FeeTxnModel {

	private Long studentYearId;

	private Long termFee;
	
	private Long bookUniformFee;

	private Long vanFee;
	
	private Long extraFee;	
	
	private Long amountPaid;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Long paymentDate;
	
	public Long getStudentYearId() {
		return studentYearId;
	}

	public void setStudentYearId(Long studentYearId) {
		this.studentYearId = studentYearId;
	}

	public Long getTermFee() {
		return termFee;
	}

	public void setTermFee(Long termFee) {
		this.termFee = termFee;
	}

	public Long getBookUniformFee() {
		return bookUniformFee;
	}

	public void setBookUniformFee(Long bookUniformFee) {
		this.bookUniformFee = bookUniformFee;
	}

	public Long getVanFee() {
		return vanFee;
	}

	public void setVanFee(Long vanFee) {
		this.vanFee = vanFee;
	}

	public Long getExtraFee() {
		return extraFee;
	}

	public void setExtraFee(Long extraFee) {
		this.extraFee = extraFee;
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
}
