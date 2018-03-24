package com.sdms.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdms.entity.FeeTxn;
import com.sdms.entity.StudentYear;
import com.sdms.model.FeeTxnModel;
import com.sdms.model.StudentInfoModel;
import com.sdms.repository.FeeTxnRepo;
import com.sdms.repository.StudentYearRepo;

@Controller
public class FeeTxnController {

	@Autowired
	FeeTxnRepo feeTxnRepo;
	@Autowired
	StudentYearRepo studentYearRepo;
	
	@RequestMapping(value={"/FeeTxn"},method = RequestMethod.GET)
	public String feeTxn( HttpServletRequest request, HttpServletResponse response) {
		FeeTxnModel feeTxnModel = new FeeTxnModel();
		request.setAttribute("FeeTxn", feeTxnModel);
		return "Library/FeeTxn";
	}
	
	@ResponseBody
	@RequestMapping(value={"/SaveFeeTxn"},method = RequestMethod.POST)
	public FeeTxn saveFeeTxn(@ModelAttribute("FeeTxn") FeeTxnModel feeTxnModel, HttpServletRequest request, HttpServletResponse response) {
		FeeTxn feeTxn = new FeeTxn();
		StudentYear studentYear = studentYearRepo.getStudentById(feeTxnModel.getStudentYearId());
		feeTxn.setStudentYear(studentYear);
		feeTxn.setAmountPaid(feeTxnModel.getAmountPaid());
		feeTxn.setPaymentDate(new Timestamp(feeTxnModel.getPaymentDate()));
		FeeTxn feeTxnSaved = feeTxnRepo.save(feeTxn);
		studentYear.setBalance(studentYear.getBalance()-feeTxnModel.getAmountPaid());
		studentYear.setPaid(studentYear.getPaid()+feeTxnModel.getAmountPaid());
		studentYearRepo.save(studentYear);
		return feeTxnSaved;
	}
}
