package com.sdms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.entity.StudentYear;

public interface StudentYearRepo extends JpaRepository<StudentYear,Long> {
	
	
	@Query("SELECT a FROM StudentYear a WHERE a.studentsInfo.admissionNo = :admissionNo")
    public StudentYear getStudentByAdNo(@Param("admissionNo") Long admissionNo);
	
	@Query("SELECT a FROM StudentYear a WHERE a.id = :id")
    public StudentYear getStudentById(@Param("id") Long id);

}
