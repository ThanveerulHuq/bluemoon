package com.sdms.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sdms.entity.AcademicYear;
import com.sdms.entity.FeeTxn;
import com.sdms.entity.StudentYear;
import com.sdms.model.FeeTxnModel;
import com.sdms.repository.AcademicYearRepo;
import com.sdms.repository.FeeTxnRepo;
import com.sdms.repository.StudentYearRepo;

@Controller
public class FeeTxnController {

	@Autowired
	FeeTxnRepo feeTxnRepo;
	@Autowired
	StudentYearRepo studentYearRepo;
	@Autowired
	AcademicYearRepo academicYearRepo;
	
	@RequestMapping(value={"/FeeTxn"},method = RequestMethod.GET)
	public String feeTxn( HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		FeeTxnModel feeTxnModel = new FeeTxnModel();
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		request.setAttribute("FeeTxn", feeTxnModel);
		return "Library/FeeTxn";
	}
	
	@RequestMapping(value={"/SaveFeeTxn"},method = RequestMethod.POST)
	public String saveFeeTxn(@ModelAttribute("FeeTxn") FeeTxnModel feeTxnModel, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		FeeTxn feeTxn = new FeeTxn();
		StudentYear studentYear = studentYearRepo.getStudentById(feeTxnModel.getStudentYearId());
		feeTxn.setStudentYear(studentYear);
//		feeTxn.setSchoolFee(feeTxnModel.getSchoolFee());
//		feeTxn.setBookFee(feeTxnModel.getBookFee());
//		feeTxn.setIslamicStudies(feeTxnModel.getIslamicStudies());
//		feeTxn.setUniformFee(feeTxnModel.getUniformFee());
		feeTxn.setVanFee(feeTxnModel.getVanFee());
		feeTxn.setExtraFee(feeTxnModel.getExtraFee());
		feeTxn.setAmountPaid(feeTxnModel.getAmountPaid());
		feeTxn.setPaymentDate(new Timestamp(feeTxnModel.getPaymentDate()));
		FeeTxn feeTxnSaved = feeTxnRepo.save(feeTxn);
//		studentYear.setBalance(studentYear.getBalance()-feeTxnModel.getAmountPaid());
//		studentYear.setPaid(studentYear.getPaid()+feeTxnModel.getAmountPaid());
//		studentYearRepo.save(studentYear);
		//request.setAttribute("Print", feeTxnSaved);
		redirectAttributes.addFlashAttribute("Print", feeTxnSaved);
		return "redirect:/PrintReceipt";
	}
	
	@RequestMapping(value={"/PrintReceipt"},method = RequestMethod.GET)
	public String printReceipt( HttpServletRequest request, HttpServletResponse response) {
		return "Library/FeeTxnPrint";
	}
	
	@RequestMapping(value={"/FeeReport"}, method = RequestMethod.GET)
	public String feeReport( HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		return "Library/FeeReport";
	}
	
	@ResponseBody
	@RequestMapping(value={"/GetFeeReport"}, method = RequestMethod.GET)
	public List getFeeReport( @ModelAttribute("startTime") String startTime, @ModelAttribute("endTime") String endTime, HttpServletRequest request, HttpServletResponse response) throws ParseException {
		List feeReport = new ArrayList();		
		if(startTime.isEmpty() || endTime.isEmpty()){
			feeReport = feeTxnRepo.findAll();
		} else {
			DateFormat dF = new SimpleDateFormat("dd-MM-yyyy");
			Date startDate = dF.parse(startTime);
			Date endDate = dF.parse(endTime);
			feeReport = feeTxnRepo.getFilterData(startDate, endDate);
		}
		return feeReport;
	}
	@ResponseBody
	@RequestMapping(value = { "/getAllStudentyearq" }, method = RequestMethod.GET)
	public List<StudentYear> getAllStudentyearq(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("q") String q,@ModelAttribute("academicYear") Long academicYear) {
	return studentYearRepo.getstudentbyname(academicYear,q);
	}
	
	@RequestMapping(value={"/RePrintReceipt"},method = RequestMethod.GET)
	public String RePrintReceipt( HttpServletRequest request, HttpServletResponse response,@ModelAttribute("id") Long id) {
		request.setAttribute("Print", feeTxnRepo.findOne(id));
		return "Library/FeeRePrint";
	}

	
}
