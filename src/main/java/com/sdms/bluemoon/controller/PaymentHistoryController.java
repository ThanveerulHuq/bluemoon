package com.sdms.bluemoon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdms.bluemoon.entity.AcademicYear;
import com.sdms.bluemoon.repository.AcademicYearRepo;
import com.sdms.bluemoon.utils.BlueMoonConstants;

@Controller
@RequestMapping(value = BlueMoonConstants.PREFIX_URL)
public class PaymentHistoryController {
	@Autowired
	AcademicYearRepo academicYearRepo;
	
	@RequestMapping(value = { "/payment-history" }, method = RequestMethod.GET)
	public String StudentReport(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		List<AcademicYear> academicYear = academicYearRepo.findAll();
		request.setAttribute("academicYear", academicYear);
		return "paymentHistory";
	}

}
