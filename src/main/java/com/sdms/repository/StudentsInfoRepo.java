package com.sdms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.entity.StudentsInfo;

public interface StudentsInfoRepo extends JpaRepository<StudentsInfo,Long>{

	@Query("SELECT a FROM StudentsInfo a WHERE a.admissionNo = :admissionNo")
    public StudentsInfo getStudentByAdNo(@Param("admissionNo") Long admissionNo);
	
	@Query("SELECT a FROM StudentsInfo a WHERE a.name like %:q% and a.active='Y'")
	public List<StudentsInfo> getstudentbyname(@Param("q")String q);
	
}
