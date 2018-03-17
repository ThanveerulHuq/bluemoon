package com.sdms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sdms.entity.DocInfo;

public interface DocInfoRepo extends JpaRepository<DocInfo,Long> {

}
