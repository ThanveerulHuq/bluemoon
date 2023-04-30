package com.sdms.bluemoon.repository;

import com.sdms.bluemoon.entity.DocInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

//@Repository
public interface DocInfoRepo extends JpaRepository<DocInfo, Long> {

    @Query("SELECT a FROM DocInfo a WHERE a.studentsInfo.studentId = :studentId")
    List<DocInfo> findByStudentId(@Param("studentId") Long studentId);

    @Query("SELECT a FROM DocInfo a WHERE a.fileName = 'profile_photo' AND a.studentsInfo.studentId = :studentId")
    DocInfo getProfilePhoto(@Param("studentId") Long studentId);


    //	@Transactional
    //	@Modifying(clearAutomatically = true)
    //	@Query("SELECT a FROM DocInfo a WHERE a.studentsInfo.studentId = :studentId")
    //    public void deleteDoc(@Param("studentId") Long studentId);

}
