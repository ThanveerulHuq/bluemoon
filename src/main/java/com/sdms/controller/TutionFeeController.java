package com.sdms.controller;

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

import com.sdms.entity.AcademicYear;
import com.sdms.entity.ClassInfo;
import com.sdms.entity.CommonFee;
import com.sdms.entity.StudentsInfo;
import com.sdms.model.StudentYearModel;
import com.sdms.repository.AcademicYearRepo;
import com.sdms.repository.ClassInfoRepo;
import com.sdms.repository.CommonFeeRepo;

@Controller
public class TutionFeeController {
	
	@Autowired
	AcademicYearRepo academicYearRepo;

	@Autowired
	ClassInfoRepo classInfoRepo;

	@Autowired
	CommonFeeRepo commonFeeRepo;
	
	@RequestMapping(value = { "/TutionFeeForm" }, method = RequestMethod.GET)
	public String tutionFeeForm(HttpServletRequest request,@ModelAttribute("Area") Long areaId, 
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes = classInfoRepo.findAll();
		CommonFee commonFee = new CommonFee();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("classes", classes);
		request.setAttribute("CommonFee", commonFee);
		request.setAttribute("areaId", areaId);
		return "TutionFeeForm";
	}
	
	@RequestMapping(value = { "/EditTutionFee" }, method = RequestMethod.GET)
	public String editTutionFee(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("Feeid") Long Feeid,@ModelAttribute("Area") Long areaId, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes = classInfoRepo.findAll();
		CommonFee commonFee = commonFeeRepo.findOne(Feeid);
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("classes", classes);
		request.setAttribute("CommonFee", commonFee);
		request.setAttribute("areaId", areaId);
		return "TutionFeeForm";
	}
	
	
	@RequestMapping(value = { "/SetFee" }, method = RequestMethod.POST)
	public String setFee(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("CommonFee") CommonFee commonFee) {
		commonFeeRepo.save(commonFee);
		return "redirect:/TutionFee";
	}
	
	@RequestMapping(value = { "/TutionFee" }, method = RequestMethod.GET)
	public String tutionFee(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		return "TutionFee";
	}
	
	
	@ResponseBody
	@RequestMapping(value={"/getCommonFee"},method = RequestMethod.GET)
	public List<CommonFee> getCommonFee(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("academicYear") Long academicYear,@ModelAttribute("Area") Long areaId) {
		List<CommonFee> commonFee = commonFeeRepo.getFeeByYr(academicYear,areaId);
		return commonFee;
	}
	
	@ResponseBody
	@RequestMapping(value={"/ValidateFee"},method = RequestMethod.GET)
	public String validateFee(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("academicYear") Long academicYear,@ModelAttribute("classId") Long classId,@ModelAttribute("Area") Long areaId) {
		CommonFee commonFee = commonFeeRepo.validateFee(academicYear,classId,areaId);
		if(commonFee == null){
			return "not exist";
		}
		else{
			return "exist";
		}
	}
	
}
