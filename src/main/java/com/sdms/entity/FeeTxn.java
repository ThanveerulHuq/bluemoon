package com.sdms.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "fee_txn")
public class FeeTxn {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@ManyToOne 
	@JoinColumn(name="student_id")
	private StudentYear studentYear;
	
	@Column(name="term_fee",nullable=false,length=15)
	private Long termFee;
	
	@Column(name="book_uniform_fee",nullable=false,length=15)
	private Long bookUniformFee;
	
	@Column(name="van_fee",nullable=false,length=15)
	private Long vanFee;
	
	@Column(name="extra_fee",nullable=false,length=15)
	private Long extraFee;
	
	public Long getExtraFee() {
		return extraFee;
	}

	public void setExtraFee(Long extraFee) {
		this.extraFee = extraFee;
	}

	@Column(name="amount_paid",nullable=false,length=15)
	private Long amountPaid;
	
	@Column(name="payment_date",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP",nullable=false)
	private Timestamp paymentDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public StudentYear getStudentYear() {
		return studentYear;
	}

	public void setStudentYear(StudentYear studentYear) {
		this.studentYear = studentYear;
	}

	public Long getAmountPaid() {
		return amountPaid;
	}

	

	public void setAmountPaid(Long amountPaid) {
		this.amountPaid = amountPaid;
	}

	public Timestamp getPaymentDate() {
		return paymentDate;
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

	public void setPaymentDate(Timestamp timestamp) {
		this.paymentDate = timestamp;
	}

	public Long getVanFee() {
		return vanFee;
	}

	public void setVanFee(Long vanFee) {
		this.vanFee = vanFee;
	}

}
