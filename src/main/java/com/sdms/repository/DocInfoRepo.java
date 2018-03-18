package com.sdms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sdms.entity.DocInfo;
//@Repository
public interface DocInfoRepo extends JpaRepository<DocInfo,Long> {

	@Query("SELECT a FROM DocInfo a WHERE a.studentsInfo.studentId = :studentId")
    public List<DocInfo> findByStudentId(@Param("studentId") Long studentId);
	

}
