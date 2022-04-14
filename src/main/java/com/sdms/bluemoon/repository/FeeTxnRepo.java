package com.sdms.bluemoon.repository;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sdms.bluemoon.entity.FeeTxn;

public interface FeeTxnRepo extends JpaRepository<FeeTxn, Long> {

	@Query("select a from FeeTxn a where a.paymentDate between :startTime and :endTime")
	public ArrayList<FeeTxn> getFilterData(@Param("startTime") Date startTime,
			@Param("endTime") Date endTime);

	@Query("select a from FeeTxn a where a.studentYear.id=:id order by paymentDate desc")
	public ArrayList<FeeTxn> getLastFiveTxn(@Param("id") Long id);
}
