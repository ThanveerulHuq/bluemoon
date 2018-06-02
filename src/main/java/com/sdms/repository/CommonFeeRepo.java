package com.sdms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.entity.CommonFee;

public interface CommonFeeRepo extends JpaRepository<CommonFee,Long> {

	@Query("SELECT a FROM CommonFee a WHERE a.classInfo.classId = :classId and a.academicYear.id = :academicYearId and a.areaInfo.id=:areaId")
    public CommonFee getFeeByClass(@Param("classId") Long classId,@Param("academicYearId") Long academicYearId,@Param("areaId") Long areaId);
	
	@Query("SELECT a FROM CommonFee a WHERE a.academicYear.id = :academicYearId and a.areaInfo.id=:areaId")
	public List<CommonFee> getFeeByYr(@Param("academicYearId")Long academicYear,@Param("areaId")Long areaId);

	@Query("SELECT a FROM CommonFee a WHERE a.academicYear.id = :academicYearId and a.areaInfo.id=:areaId and a.classInfo.classId = :classId")
	public CommonFee validateFee(@Param("academicYearId")Long academicYear,@Param("classId")Long classId,@Param("areaId")Long areaId);
	
	
}
