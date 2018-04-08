package com.sdms.controller;

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

import com.sdms.entity.AcademicYear;
import com.sdms.entity.ClassInfo;
import com.sdms.entity.StudentYear;
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
	@RequestMapping(value={"/getstudentyearbyclass"},method = RequestMethod.GET)
	public List<StudentYear> getstudentyearbyclass(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("academicYear") Long academicYear,@ModelAttribute("classId") Long classId,@ModelAttribute("section") String section){
		List<StudentYear> studentYear= studentYearRepo.getbyclass(academicYear,classId,section);
		return studentYear;
	}
	
	
}
