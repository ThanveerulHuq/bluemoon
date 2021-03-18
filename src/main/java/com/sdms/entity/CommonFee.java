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
	
	@Column(name="corona_concession",nullable=false,length=15)
	private Long corona_concession;

	@ManyToOne 
	@JoinColumn(name="academic_year")
	private AcademicYear academicYear;

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

	public Long getCorona_concession() {
		return corona_concession;
	}

	public void setCorona_concession(Long corona_concession) {
		this.corona_concession = corona_concession;
	}
	

}
