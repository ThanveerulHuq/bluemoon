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
@Table(name = "students_info")
public class StudentsInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "student_id")
	private Long studentId;
	
	@Column(name="aadhar_no",nullable=false,length=12)
	private Long aadharNo;
	
	@Column(name="admission_no",nullable=false,length=15)
	private Long admissionNo;	
	
	@Column(name="emis_no",nullable=false,length=15)
	private Long emisNo;	
		
	@Column(name="name",nullable=false,length=40)
	private String name;
	
	@Column(name="gender",nullable=false,length=1)
	private String gender;
	
	@Column(name="age",nullable=false,length=3)
	private Long age;
	
	@Column(name="dob",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP",nullable=false)
	private Timestamp dob;
	
	@Column(name="community",nullable=false,length=30)
	private String community;
	
	@Column(name="mother_tongue",nullable=false,length=10)
	private String motherTongue;
	
	@Column(name="mobile_no1",nullable=false,length=15)
	private Long mobileNo1;
	
	@Column(name="mobile_no2",nullable=false,length=15)
	private Long mobileNo2;
	
	@Column(name="father_name",nullable=false,length=40)
	private String fatherName;
	
	@Column(name="mother_name",nullable=false,length=40)
	private String motherName;
	
	@Column(name="address",nullable=false,length=1000)
	private String address;
	
	@Column(name="previous_school",nullable=true,length=100)
	private String previousSchool;
	
	@Column(name="active",nullable=false,length=1)
	private String active;
	
	@Column(name="admission_date",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP",nullable=false)
	private Timestamp admissionDate;
	
	@Column(name="religion",nullable=false,length=15)
	private String religion;
	
	@Column(name="caste",nullable=false,length=30)
	private String caste;
	
	@Column(name="nationality",nullable=false,length=15)
	private String nationality;
	
	@Column(name="remarks",nullable=false,length=1000)
	private String remarks;

	@ManyToOne 
	@JoinColumn(name="area_info")
	private AreaInfo areaInfo;

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public Long getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(Long aadharNo) {
		this.aadharNo = aadharNo;
	}

	public Long getAdmissionNo() {
		return admissionNo;
	}

	public void setAdmissionNo(Long admissionNo) {
		this.admissionNo = admissionNo;
	}

	public Long getEmisNo() {
		return emisNo;
	}

	public void setEmisNo(Long emisNo) {
		this.emisNo = emisNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Long getAge() {
		return age;
	}

	public void setAge(Long age) {
		this.age = age;
	}

	public Timestamp getDob() {
		return dob;
	}

	public void setDob(Timestamp dob) {
		this.dob = dob;
	}

	public String getCommunity() {
		return community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}

	public String getMotherTongue() {
		return motherTongue;
	}

	public void setMotherTongue(String motherTongue) {
		this.motherTongue = motherTongue;
	}

	public Long getMobileNo1() {
		return mobileNo1;
	}

	public void setMobileNo1(Long mobileNo1) {
		this.mobileNo1 = mobileNo1;
	}

	public Long getMobileNo2() {
		return mobileNo2;
	}

	public void setMobileNo2(Long mobileNo2) {
		this.mobileNo2 = mobileNo2;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPreviousSchool() {
		return previousSchool;
	}

	public void setPreviousSchool(String previousSchool) {
		this.previousSchool = previousSchool;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public Timestamp getAdmissionDate() {
		return admissionDate;
	}

	public void setAdmissionDate(Timestamp admissionDate) {
		this.admissionDate = admissionDate;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getCaste() {
		return caste;
	}

	public void setCaste(String caste) {
		this.caste = caste;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public AreaInfo getAreaInfo() {
		return areaInfo;
	}

	public void setAreaInfo(AreaInfo areaInfo) {
		this.areaInfo = areaInfo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
