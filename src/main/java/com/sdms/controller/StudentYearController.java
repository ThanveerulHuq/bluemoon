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
import com.sdms.entity.CommonFee;
import com.sdms.entity.StudentYear;
import com.sdms.entity.StudentsInfo;
import com.sdms.model.StudentYearModel;
import com.sdms.repository.AcademicYearRepo;
import com.sdms.repository.ClassInfoRepo;
import com.sdms.repository.CommonFeeRepo;
import com.sdms.repository.StudentYearRepo;
import com.sdms.repository.StudentsInfoRepo;

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

	@Autowired
	StudentsInfoRepo studentsInfoRepo;

	@RequestMapping(value = { "/StudentYear" }, method = RequestMethod.GET)
	public String StudentYear(HttpServletRequest request,
			HttpServletResponse response) {
		StudentYearModel StudentsYear = new StudentYearModel();
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes = classInfoRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("classes", classes);
		request.setAttribute("StudentsYear", StudentsYear);

		return "StudentYear/StudentYear";
	}
	@RequestMapping(value = { "/editStudentYear" }, method = RequestMethod.GET)
	public String editStudentYear(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("studentYrId") Long studentYrId) {
		StudentYearModel studentsYearModel = new StudentYearModel();
		StudentYear studentYear = studentYearRepo.findOne(studentYrId);
		studentsYearModel.setAcademicYear(studentYear.getCommonFee().getAcademicYear());
		studentsYearModel.setAdmissionNo(studentYear.getStudentsInfo().getAdmissionNo());
		studentsYearModel.setSection(studentYear.getSection());
		studentsYearModel.setVan_fee(studentYear.getVanFee());
		studentsYearModel.setBook_fee(studentYear.getBookFee());
		studentsYearModel.setUniform_fee(studentYear.getUniformFee());
		studentsYearModel.setIslamic_studies(studentYear.getIslamicStudies());
		studentsYearModel.setScholorship(studentYear.getScholorship());
		
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes = classInfoRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("classes", classes);
		request.setAttribute("StudentsYear", studentsYearModel);
		request.setAttribute("studentName", studentYear.getStudentsInfo().getName());
		request.setAttribute("fatherName", studentYear.getStudentsInfo().getFatherName());
		request.setAttribute("classId", studentYear.getCommonFee().getClassInfo().getClassId());
		return "StudentYear/StudentYear";
	}

	@RequestMapping(value = { "/MapStudent" }, method = RequestMethod.POST)
	public String MapStudent(
			@ModelAttribute("StudentsYear") StudentYearModel studentYearModel,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println(studentYearModel.getBook_fee());
		StudentYear studentYear = new StudentYear();
		StudentsInfo studentsInfo = studentsInfoRepo.findOne(studentYearModel.getStudentId());
		CommonFee commonFee = commonFeeRepo.findOne(studentYearModel.getFeeId());
		studentYear.setStudentsInfo(studentsInfo);
		studentYear.setCommonFee(commonFee);
		studentYear.setSection(studentYearModel.getSection());
		studentYear.setVanFee(studentYearModel.getVan_fee());
		studentYear.setScholorship(studentYearModel.getScholorship());
		studentYear.setBookFee(studentYearModel.getBook_fee());
		studentYear.setUniformFee(studentYearModel.getUniform_fee());
		studentYear.setIslamicStudies(studentYearModel.getIslamic_studies());
		Long total=getTotal(studentYearModel,commonFee.getSchoolFee());
		studentYear.setTotal(total);
		studentYear.setPaid((long) 0);
		studentYear.setBalance(total);		
		studentYearRepo.save(studentYear);
		return "redirect:/StudentYear";
	}
	private Long getTotal(StudentYearModel studentYearModel,Long schoolFee) {
		Long total=schoolFee+studentYearModel.getVan_fee()+studentYearModel.getBook_fee()+studentYearModel.getUniform_fee()+studentYearModel.getIslamic_studies()-studentYearModel.getScholorship();
		return total;
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
	
	@ResponseBody
	@RequestMapping(value = { "/getStudentInfoByAdNo" }, method = RequestMethod.GET)
	public StudentsInfo getStudentInfoByAdNo(
			@ModelAttribute("admissionNo") Long admissionNo,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println(admissionNo);
		StudentsInfo studentsInfo= studentsInfoRepo.getStudentByAdNo(admissionNo);
		return studentsInfo;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/getCommonFeeByClass" }, method = RequestMethod.GET)
	public CommonFee getCommonFeeByClass (@ModelAttribute("classId") Long classId,@ModelAttribute("academicYearId") Long academicYearId,
			HttpServletRequest request, HttpServletResponse response){
		return commonFeeRepo.getFeeByClass(classId,academicYearId);
	}
}
