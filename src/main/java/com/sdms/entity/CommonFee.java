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
@Table(name="common_fee")
public class CommonFee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@ManyToOne 
	@JoinColumn(name="class_id")
	private ClassInfo classInfo;
	
	@Column(name="school_fee",nullable=false,length=15)
	private Long schoolFee;
	
	@Column(name="book_fee",nullable=false,length=15)
	private Long bookFee;
	
	@Column(name="uniform_fee",nullable=false,length=15)
	private Long uniformFee;


	@ManyToOne 
	@JoinColumn(name="academic_year")
	private AcademicYear academicYear;
	
	
	@ManyToOne 
	@JoinColumn(name="area_info")
	private AreaInfo areaInfo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ClassInfo getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}

	public Long getSchoolFee() {
		return schoolFee;
	}

	public void setSchoolFee(Long schoolFee) {
		this.schoolFee = schoolFee;
	}

	public AcademicYear getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(AcademicYear academicYear) {
		this.academicYear = academicYear;
	}
	
	public Long getBookFee() {
		return bookFee;
	}

	public void setBookFee(Long bookFee) {
		this.bookFee = bookFee;
	}

	public AreaInfo getAreaInfo() {
		return areaInfo;
	}

	public void setAreaInfo(AreaInfo areaInfo) {
		this.areaInfo = areaInfo;
	}

	public Long getUniformFee() {
		return uniformFee;
	}

	public void setUniformFee(Long uniformFee) {
		this.uniformFee = uniformFee;
	}

}
