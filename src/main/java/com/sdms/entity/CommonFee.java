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
	


	@ManyToOne 
	@JoinColumn(name="academic_year")
	private ClassInfo academicYear;

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

	public ClassInfo getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(ClassInfo academicYear) {
		this.academicYear = academicYear;
	}
	

}
