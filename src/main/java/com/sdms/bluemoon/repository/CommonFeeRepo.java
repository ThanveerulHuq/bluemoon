package com.sdms.bluemoon.repository;

import com.sdms.bluemoon.entity.CommonFee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommonFeeRepo extends JpaRepository<CommonFee, Long> {


    @Query("SELECT a FROM CommonFee a WHERE a.classInfo.classId = :classId and a.academicYear.id = :academicYearId")
    CommonFee getFeeByClass(@Param("classId") Long classId, @Param("academicYearId") Long academicYearId);


    @Query("SELECT a FROM CommonFee a WHERE a.academicYear.id = :academicYearId")
    List<CommonFee> getFeeByYr(@Param("academicYearId") Long academicYear);
}
