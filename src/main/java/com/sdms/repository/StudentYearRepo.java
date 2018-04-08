package com.sdms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.entity.StudentYear;

public interface StudentYearRepo extends JpaRepository<StudentYear,Long> {
	
	
	@Query("SELECT a FROM StudentYear a WHERE a.studentsInfo.admissionNo = :admissionNo and a.commonFee.academicYear.id = :academicYear")
    public StudentYear getStudentByAdNo(@Param("admissionNo") Long admissionNo,@Param("academicYear")Long academicYear);
	
	@Query("SELECT a FROM StudentYear a WHERE a.id = :id")
    public StudentYear getStudentById(@Param("id") Long id);
	
	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear")
	public List<com.sdms.entity.StudentYear> getStudentByYear(@Param("academicYear")Long academicYear);
	
	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear and a.commonFee.classInfo.classId like :classId and a.section like :section")
	public List<StudentYear> getbyclass(@Param("academicYear")Long academicYear,@Param("classId") Long classId,	@Param("section")String section);

}
