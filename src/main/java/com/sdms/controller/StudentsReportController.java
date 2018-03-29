package com.sdms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdms.entity.AcademicYear;
import com.sdms.entity.ClassInfo;
import com.sdms.model.StudentYearModel;
import com.sdms.repository.AcademicYearRepo;
import com.sdms.repository.ClassInfoRepo;
@Controller
public class StudentsReportController {
	
	@Autowired
	AcademicYearRepo academicYearRepo;
	@Autowired
	ClassInfoRepo classInfoRepo;
	
	
	
	@RequestMapping(value = { "/StudentReport" }, method = RequestMethod.GET)
	public String StudentReport(HttpServletRequest request,
			HttpServletResponse response) {
		StudentYearModel StudentsYear = new StudentYearModel();
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("StudentsYear", StudentsYear);
		return "StudentReport";
	}
}
