package com.sdms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="student_year")
public class StudentYear {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@ManyToOne 
	@JoinColumn(name="student_id")
	private StudentsInfo studentsInfo;
	
	@ManyToOne 
	@JoinColumn(name="common_fee")
	private CommonFee commonFee;
	
	@Column(name="section",nullable=false,length=1)
	private String section;
	
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

	@Column(name="scholorship",nullable=false,length=15)
	private Long scholorship;
	
	@Column(name="total",nullable=false,length=15)
	private Long total;
	
	@ManyToOne 
	@JoinColumn(name="paid_fee")
	private PaidFee paidFee;
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public StudentsInfo getStudentsInfo() {
		return studentsInfo;
	}

	public void setStudentsInfo(StudentsInfo studentsInfo) {
		this.studentsInfo = studentsInfo;
	}

	public CommonFee getCommonFee() {
		return commonFee;
	}

	public void setCommonFee(CommonFee commonFee) {
		this.commonFee = commonFee;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public void setVanFee(Long vanFee) {
		this.vanFee = vanFee;
	}
	public Long getScholorship() {
		return scholorship;
	}

	public void setScholorship(Long scholorship) {
		this.scholorship = scholorship;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public PaidFee getPaidFee() {
		return paidFee;
	}

	public void setPaidFee(PaidFee paidFee) {
		this.paidFee = paidFee;
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
	
	public Long getTermFee() {
		return termFee;
	}

	public void setTermFee(Long termFee) {
		this.termFee = termFee;
	}

	
	
}
