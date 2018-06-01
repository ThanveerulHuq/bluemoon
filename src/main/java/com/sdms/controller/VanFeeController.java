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

import com.sdms.entity.VanFee;
import com.sdms.repository.VanFeeRepo;

@Controller
public class VanFeeController {

	@Autowired
	VanFeeRepo vanFeeRepo;
	
	@RequestMapping(value = { "/VanFeeForm" }, method = RequestMethod.GET)
	public String tutionFeeForm(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		VanFee vanFee = new VanFee();
		request.setAttribute("VanFee", vanFee);
		return "VanFeeForm";
	}
	
	@RequestMapping(value = { "/EditVanFee" }, method = RequestMethod.GET)
	public String editVanFee(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("FeeId") Long feeId, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		VanFee vanFee = vanFeeRepo.findOne(feeId);
		request.setAttribute("VanFee", vanFee);
		return "VanFeeForm";
	}
	
	@RequestMapping(value = { "/VanFee" }, method = RequestMethod.GET)
	public String VanFee(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
		return "VanFee";
	}
	
	@RequestMapping(value = { "/SetVanFee" }, method = RequestMethod.POST)
	public String setFee(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("VanFee") VanFee vanFee) {
		vanFeeRepo.save(vanFee);
		return "redirect:/VanFee";
	}
	
	@ResponseBody
	@RequestMapping(value={"/getVanFee"},method = RequestMethod.GET)
	public List<VanFee> getCommonFee(HttpServletRequest request, HttpServletResponse response) {
		List<VanFee> vanFeeList = vanFeeRepo.findAll();
		return vanFeeList;
	}
	
}
