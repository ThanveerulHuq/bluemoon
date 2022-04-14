package com.sdms.bluemoon.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdms.bluemoon.entity.AcademicYear;
import com.sdms.bluemoon.entity.ClassInfo;
import com.sdms.bluemoon.entity.StudentYear;
import com.sdms.bluemoon.model.StudentYearModel;
import com.sdms.bluemoon.repository.AcademicYearRepo;
import com.sdms.bluemoon.repository.ClassInfoRepo;
import com.sdms.bluemoon.repository.StudentYearRepo;
import com.sdms.bluemoon.utils.BlueMoonConstants;
@Controller
@RequestMapping(value = BlueMoonConstants.PREFIX_URL)
public class StudentsReportController {
	
	@Autowired
	AcademicYearRepo academicYearRepo;
	@Autowired
	ClassInfoRepo classInfoRepo;
	@Autowired
	StudentYearRepo studentYearRepo;
	
	@RequestMapping(value = { "/StudentReport" }, method = RequestMethod.GET)
	public String StudentReport(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		StudentYearModel StudentsYear = new StudentYearModel();
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes= classInfoRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("StudentsYear", StudentsYear);
		request.setAttribute("classes", classes);
		return "StudentReport";
	}

	@ResponseBody
	@RequestMapping(value = { "/getstudentyearbyclass" }, method = RequestMethod.GET)
	public List<StudentYear> getstudentyearbyclass(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("academicYear") Long academicYear,
			@ModelAttribute("classId") Long classId,
			@ModelAttribute("section") String section) {
		System.out.println(section);
		List<StudentYear> studentYear = new ArrayList<StudentYear>();
		if (classId == -1 && section.contentEquals("all")) {
			studentYear = studentYearRepo.getStudentByYear(academicYear);
			return studentYear;
		} else {
			if (classId == -1 && !section.contentEquals("all")) {
				studentYear = studentYearRepo.getbysection(academicYear,
						section);
				return studentYear;
			} 
			if (section.contentEquals("all"))
			{
				System.out.println("in side out");
				studentYear = studentYearRepo.getbyclassId(academicYear,
						classId);
				return studentYear;
			}
			if (classId != -1 && !section.contentEquals("all")) {
				studentYear = studentYearRepo.getbyclass(academicYear, classId,
						section);
				return studentYear;
			}
		}
		return studentYear;
	}
		
	}
	
	

