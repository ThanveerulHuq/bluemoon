package com.sdms.controller;

import java.io.IOException;
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
import com.sdms.entity.PaidFee;
import com.sdms.entity.StudentYear;
import com.sdms.entity.StudentsInfo;
import com.sdms.model.StudentYearModel;
import com.sdms.repository.AcademicYearRepo;
import com.sdms.repository.ClassInfoRepo;
import com.sdms.repository.CommonFeeRepo;
import com.sdms.repository.PaidFeeRepo;
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
	
	@Autowired
	PaidFeeRepo paidFeeRepo;

	@RequestMapping(value = { "/StudentYear" }, method = RequestMethod.GET)
	public String StudentYear(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
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
			HttpServletResponse response,@ModelAttribute("studentYrId") Long studentYrId, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		StudentYearModel studentsYearModel = new StudentYearModel();
		StudentYear studentYear = studentYearRepo.findOne(studentYrId);
		studentsYearModel.setStudentYearId(studentYrId);
		studentsYearModel.setFeeId(studentYear.getCommonFee().getId());
		studentsYearModel.setStudentId(studentYear.getStudentsInfo().getStudentId());
		studentsYearModel.setAcademicYear(studentYear.getCommonFee().getAcademicYear());
		studentsYearModel.setAdmissionNo(studentYear.getStudentsInfo().getAdmissionNo());
		studentsYearModel.setSection(studentYear.getSection());
		studentsYearModel.setVan_fee(studentYear.getVanFee());
//		studentsYearModel.setBook_fee(studentYear.getBookFee());
		studentsYearModel.setUniform_fee(studentYear.getUniformFee());
		studentsYearModel.setIslamic_studies(studentYear.getIslamicStudies());
		studentsYearModel.setScholorship(studentYear.getScholorship());
		
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		List<ClassInfo> classes = classInfoRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("classes", classes);
		request.setAttribute("StudentsYear", studentsYearModel);
		request.setAttribute("studentName", studentYear.getStudentsInfo().getName()+",");
		request.setAttribute("fatherName", studentYear.getStudentsInfo().getFatherName());
		request.setAttribute("classId", studentYear.getCommonFee().getClassInfo().getClassId());
		request.setAttribute("tutionfee", studentYear.getCommonFee().getSchoolFee());
		request.setAttribute("bookfee", studentYear.getCommonFee().getBookFee());
		request.setAttribute("corona_concession", studentYear.getCommonFee().getCorona_concession());
		return "StudentYear/StudentYear";
	}

	@RequestMapping(value = { "/MapStudent" }, method = RequestMethod.POST)
	public String MapStudent(
			@ModelAttribute("StudentsYear") StudentYearModel studentYearModel,
			HttpServletRequest request, HttpServletResponse response) {
		Long newStudentYrId =studentYearModel.getStudentYearId();
		System.out.println(studentYearModel.getStudentId());
		StudentYear studentYear = new StudentYear();
		StudentsInfo studentsInfo = studentsInfoRepo.findOne(studentYearModel.getStudentId());
		CommonFee commonFee = commonFeeRepo.findOne(studentYearModel.getFeeId());
		studentYear.setId(newStudentYrId);
		studentYear.setStudentsInfo(studentsInfo);
		studentYear.setCommonFee(commonFee);
		studentYear.setSection(studentYearModel.getSection());
		studentYear.setVanFee(studentYearModel.getVan_fee());
		studentYear.setScholorship(studentYearModel.getScholorship());
		studentYear.setCorona_concession(studentYearModel.getCorona_concession());
//		studentYear.setBookFee(studentYearModel.getBook_fee());
		studentYear.setUniformFee(studentYearModel.getUniform_fee());
		studentYear.setIslamicStudies(studentYearModel.getIslamic_studies());
		Long total=getTotal(studentYearModel,commonFee.getSchoolFee(),commonFee.getBookFee());
		studentYear.setTotal(total);
		if(newStudentYrId!=null){
			StudentYear oldStudentYr =studentYearRepo.findOne(newStudentYrId);
			studentYear.setPaidFee(oldStudentYr.getPaidFee());
		}else{
			PaidFee paidFee = new PaidFee();
			paidFee.setBookFee((long) 0);
			paidFee.setVanFee((long) 0);
			paidFee.setIslamicStudies((long) 0);
			paidFee.setUniformFee((long) 0);
			paidFee.setSchoolFee((long) 0);
			PaidFee paidFeenew = paidFeeRepo.save(paidFee);
			System.out.println("paidfee id"+paidFeenew.getId().toString());
			studentYear.setPaidFee(paidFeenew);
		}
		studentYearRepo.save(studentYear);
		return "redirect:/CurrentStudents";
	}
	private Long getTotal(StudentYearModel studentYearModel,Long schoolFee,Long BookFee) {
//		+studentYearModel.getBook_fee()
		Long total=schoolFee+BookFee+studentYearModel.getVan_fee()+studentYearModel.getUniform_fee()+studentYearModel.getIslamic_studies()-studentYearModel.getScholorship();
		return total;
	}

	@ResponseBody
	@RequestMapping(value = { "/getStudentByAdNo" }, method = RequestMethod.GET)
	public StudentYear getStudentByAdNo(
			@ModelAttribute("admissionNo") Long admissionNo,@ModelAttribute("academicYearId") Long academicYearId,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println(admissionNo);
		StudentYear studentYear = studentYearRepo.getStudentByAdNo(admissionNo,academicYearId);
		return studentYear;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/getStudentInfoByAdNo" }, method = RequestMethod.GET)
	public StudentsInfo getStudentInfoByAdNo(
			@ModelAttribute("admissionNo") Long admissionNo,
			HttpServletRequest request, HttpServletResponse response) {
		StudentsInfo studentsInfo= studentsInfoRepo.getStudentByAdNo(admissionNo);
		return studentsInfo;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/getCommonFeeByClass" }, method = RequestMethod.GET)
	public CommonFee getCommonFeeByClass (@ModelAttribute("classId") Long classId,@ModelAttribute("academicYearId") Long academicYearId,
			HttpServletRequest request, HttpServletResponse response){
		return commonFeeRepo.getFeeByClass(classId,academicYearId);
	}
	
	@RequestMapping(value = { "/CurrentStudents" }, method = RequestMethod.GET)
	public String currentStudents(HttpServletRequest request,
			HttpServletResponse response) {
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		return "currentstudents";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/getStudentYearByYear" }, method = RequestMethod.GET)
	public List<StudentYear> getStudentYearByYear(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("academicYear") Long academicYear) {
		List<StudentYear> students= studentYearRepo.getStudentByYear(academicYear);	
		
		return students;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/CheckStdFrUnique" }, method = RequestMethod.GET)
	public String CheckStdFrUnique(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("academicYear") Long academicYear,@ModelAttribute("studentId") Long studentId) {
		StudentYear student= studentYearRepo.getStudentById(studentId, academicYear);	
		if(student == null){
			return "not exist";
		}
		else{
			return "exist";
		}
		
	}
	@ResponseBody
	@RequestMapping(value = { "/getAllStudentsNamebyq" }, method = RequestMethod.GET)
	public List<StudentsInfo> getAllStudentsName(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("q") String q) throws IOException {
	return studentsInfoRepo.getstudentbyname(q);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/getStudentbyId" }, method = RequestMethod.GET)
	public StudentsInfo getStudentbyId(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("id") Long id) throws IOException {
	return studentsInfoRepo.findOne(id);
	}
	
}
