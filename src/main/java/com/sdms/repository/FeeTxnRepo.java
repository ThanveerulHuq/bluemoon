package com.sdms.repository;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sdms.entity.FeeTxn;

public interface FeeTxnRepo extends JpaRepository<FeeTxn, Long>{

	
//	@Query("select a from FeeTxn a where ")
//    public ArrayList<FeeTxn> getFilterData();
	
}
