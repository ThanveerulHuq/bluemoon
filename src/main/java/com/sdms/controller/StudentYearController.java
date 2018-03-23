package com.sdms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdms.entity.AcademicYear;
import com.sdms.entity.ClassInfo;
import com.sdms.entity.StudentYear;
import com.sdms.model.StudentYearModel;
import com.sdms.repository.AcademicYearRepo;
import com.sdms.repository.ClassInfoRepo;
import com.sdms.repository.CommonFeeRepo;
import com.sdms.repository.StudentYearRepo;

@Controller
public class StudentYearController {

	@Autowired
	AcademicYearRepo academicYearRepo;

	@Autowired
	ClassInfoRepo classInfoRepo;

	@Autowired
	CommonFeeRepo commonFeeRepo;

	@Autowired
	StudentYearRepo studentYearRepo;

	@RequestMapping(value = { "/StudentYear" }, method = RequestMethod.GET)
	public String StudentYear(HttpServletRequest request,
			HttpServletResponse response) {
		StudentYearModel StudentsYear = new StudentYearModel();

		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes= classInfoRepo.findAll();
		
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("classes", classes);
		request.setAttribute("StudentsYear", StudentsYear);

		return "StudentYear/StudentYear";
	}

	@RequestMapping(value = { "/MapStudent" }, method = RequestMethod.POST)
	public String MapStudent(
			@ModelAttribute("StudentsYear") StudentYearModel StudentsYear,
			HttpServletRequest request, HttpServletResponse response) {

		return "StudentYear/StudentYear";
	}
	@ResponseBody
	@RequestMapping(value = { "/getStudentByAdNo" }, method = RequestMethod.GET)
	public StudentYear getStudentByAdNo(
			@ModelAttribute("admissionNo") Long admissionNo,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println(admissionNo);
		StudentYear studentYear = studentYearRepo.getStudentByAdNo(admissionNo);
		return studentYear;
	}
	
	

}
