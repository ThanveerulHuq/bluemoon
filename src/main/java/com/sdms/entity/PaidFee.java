package com.sdms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "paid_fee")
public class PaidFee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getVanFee() {
		return vanFee;
	}

	public void setVanFee(Long vanFee) {
		this.vanFee = vanFee;
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

	
}
