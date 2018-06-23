package com.sdms.model;

import com.sdms.entity.AcademicYear;

public class StudentYearModel {
	
	private Long studentYearId;
	
	private AcademicYear academicYear;
	
	private Long FeeId;
	
	private Long StudentId;
	
	private Long admissionNo;
	
	private String section;
	
	private Long van_fee;
	
	private Long extra_fee;
	
	private Long book_uniform_fee;
	
	private Long term_fee;
	
	private Long scholorship;

	public AcademicYear getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(AcademicYear academicYear) {
		this.academicYear = academicYear;
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
		return admissionNo;
	}

	public void setAdmissionNo(Long admissionNo) {
		this.admissionNo = admissionNo;
	}

	public Long getFeeId() {
		return FeeId;
	}

	public void setFeeId(Long FeeId) {
		this.FeeId = FeeId;
	}

	public Long getStudentYearId() {
		return studentYearId;
	}

	public void setStudentYearId(Long studentYearId) {
		this.studentYearId = studentYearId;
	}

	public Long getExtra_fee() {
		return extra_fee;
	}

	public void setExtra_fee(Long extra_fee) {
		this.extra_fee = extra_fee;
	}

	public Long getBook_uniform_fee() {
		return book_uniform_fee;
	}

	public void setBook_uniform_fee(Long book_uniform_fee) {
		this.book_uniform_fee = book_uniform_fee;
	}

	public Long getTerm_fee() {
		return term_fee;
	}

	public void setTerm_fee(Long term_fee) {
		this.term_fee = term_fee;
	}
	
}
