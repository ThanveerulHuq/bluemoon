package com.sdms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sdms.entity.PaidFee;

public interface PaidFeeRepo  extends JpaRepository<PaidFee, Long>{
	
	

}
