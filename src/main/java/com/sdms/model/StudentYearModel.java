package com.sdms.model;

import com.sdms.entity.AcademicYear;
import com.sdms.entity.CommonFee;

public class StudentYearModel {
	
	
	private AcademicYear academicYear;
	
	private CommonFee commonFee;
	
	private Long StudentId;
	
	private Long AdmissionNo;
	
	private String section;
	
	private Long van_fee;
	
	private Long book_fee;
	
	private Long uniform_fee;
	
	private Long islamic_studies;
	
	private Long scholorship;

	public AcademicYear getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(AcademicYear academicYear) {
		this.academicYear = academicYear;
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

	public Long getVan_fee() {
		return van_fee;
	}

	public void setVan_fee(Long van_fee) {
		this.van_fee = van_fee;
	}

	public Long getBook_fee() {
		return book_fee;
	}

	public void setBook_fee(Long book_fee) {
		this.book_fee = book_fee;
	}

	public Long getUniform_fee() {
		return uniform_fee;
	}

	public void setUniform_fee(Long uniform_fee) {
		this.uniform_fee = uniform_fee;
	}

	public Long getIslamic_studies() {
		return islamic_studies;
	}

	public void setIslamic_studies(Long islamic_studies) {
		this.islamic_studies = islamic_studies;
	}

	public Long getScholorship() {
		return scholorship;
	}

	public void setScholorship(Long scholorship) {
		this.scholorship = scholorship;
	}

	public Long getStudentId() {
		return StudentId;
	}

	public void setStudentId(Long studentId) {
		StudentId = studentId;
	}

	public Long getAdmissionNo() {
		return AdmissionNo;
	}

	public void setAdmissionNo(Long admissionNo) {
		AdmissionNo = admissionNo;
	}
	
}
