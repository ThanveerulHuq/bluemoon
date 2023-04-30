package com.sdms.bluemoon.repository;

import com.sdms.bluemoon.entity.StudentsInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface StudentsInfoRepo extends JpaRepository<StudentsInfo, Long> {

    @Query("SELECT a FROM StudentsInfo a WHERE a.admissionNo = :admissionNo")
    StudentsInfo getStudentByAdNo(@Param("admissionNo") Long admissionNo);

    @Query("SELECT a FROM StudentsInfo a WHERE a.name like %:q% and a.active='Y'")
    List<StudentsInfo> getstudentbyname(@Param("q") String q);

}
