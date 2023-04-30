package com.sdms.bluemoon.repository;

import com.sdms.bluemoon.entity.FeeTxn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;
import java.util.Date;

public interface FeeTxnRepo extends JpaRepository<FeeTxn, Long> {

    @Query("select a from FeeTxn a where a.paymentDate between :startTime and :endTime")
    ArrayList<FeeTxn> getFilterData(@Param("startTime") Date startTime,
                                    @Param("endTime") Date endTime);

    @Query("select a from FeeTxn a where a.studentYear.id=:id order by paymentDate desc")
    ArrayList<FeeTxn> findByStudentYearId(@Param("id") Long id);

}
