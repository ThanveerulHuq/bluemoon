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
	
	@Column(name="uniform_fee",nullable=false,length=15)
	private Long uniformFee;
	
	@Column(name="islamic_studies",nullable=false,length=15)
	private Long islamicStudies;
	
	@ManyToOne 
	@JoinColumn(name="van_fee")
	private VanFee vanFee;
	
	
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

	public VanFee getVanFee() {
		return vanFee;
	}

	public void setVanFee(VanFee vanFee) {
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
	
	
	
}
