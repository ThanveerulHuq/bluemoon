package com.sdms.bluemoon.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.bluemoon.entity.StudentYear;

public interface StudentYearRepo extends JpaRepository<StudentYear,Long> {
	
	
	@Query("SELECT a FROM StudentYear a WHERE a.studentsInfo.admissionNo = :admissionNo and a.commonFee.academicYear.id = :academicYear")
    public StudentYear getStudentByAdNo(@Param("admissionNo") Long admissionNo,@Param("academicYear")Long academicYear);
	
	@Query("SELECT a FROM StudentYear a WHERE a.id = :id")
    public StudentYear getStudentById(@Param("id") Long id);
	
	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear and a.studentsInfo.active = 'Y'")
	public List<com.sdms.bluemoon.entity.StudentYear> getStudentByYear(@Param("academicYear")Long academicYear);
	
	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear and a.commonFee.classInfo.classId like :classId and a.section like :section")
	public List<StudentYear> getbyclass(@Param("academicYear")Long academicYear,@Param("classId") Long classId,	@Param("section")String section);
	
	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear and a.section like :section")
	public List<StudentYear> getbysection(@Param("academicYear")Long academicYear,	@Param("section")String section);
	
	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear and a.commonFee.classInfo.classId like :classId")
	public List<StudentYear> getbyclassId(@Param("academicYear")Long academicYear,@Param("classId") Long classId);

	@Query("SELECT a FROM StudentYear a WHERE a.commonFee.academicYear.id = :academicYear and a.studentsInfo.name like %:q%")
	public List<StudentYear> getstudentbyname(@Param("academicYear")Long academicYear,@Param("q")String q);
	
	@Query("SELECT a FROM StudentYear a WHERE a.studentsInfo.studentId = :studentId and a.commonFee.academicYear.id = :academicYear")
    public StudentYear getStudentById(@Param("studentId") Long studentId,@Param("academicYear")Long academicYear);
	
}


