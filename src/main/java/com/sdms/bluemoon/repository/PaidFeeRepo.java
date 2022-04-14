package com.sdms.bluemoon.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sdms.bluemoon.entity.PaidFee;

public interface PaidFeeRepo  extends JpaRepository<PaidFee, Long>{
	
	

}
