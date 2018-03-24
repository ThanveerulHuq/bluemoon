package com.sdms.model;

import org.springframework.format.annotation.DateTimeFormat;

public class FeeTxnModel {

	private Long studentYearId;
	
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
