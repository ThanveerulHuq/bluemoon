package com.sdms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.entity.AreaInfo;

public interface AreaInfoRepo extends JpaRepository<AreaInfo,Long> {
	@Query("SELECT a FROM AreaInfo a WHERE lower(a.area) = lower(:area)")
	public AreaInfo getAreaId(@Param("area")String area);
}
