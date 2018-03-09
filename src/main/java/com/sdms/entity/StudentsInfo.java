package com.sdms.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
	@Column(name="admission_no",nullable=false)
	private Long admissionNo;	
	
	@Column(name="emis_no",nullable=false)
	private Long emisNo;	
		
	@Column(name="name",nullable=false,length=40)
	private String name;
	
	@Column(name="gender",nullable=false,length=1)
	private String gender;
	
	@Column(name="age",nullable=false,length=3)
	private Long age;
	
	@Column(name="dob",columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP",nullable=false)
	private Timestamp dob;
	
	@Column(name="community",nullable=false,length=10)
	private String community;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
