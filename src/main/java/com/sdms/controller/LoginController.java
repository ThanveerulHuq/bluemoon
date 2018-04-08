package com.sdms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@RequestMapping(value={"/Login"},method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return "Library/Login";
	}
	
	@ResponseBody
	@RequestMapping(value={"/GetLogin"},method = RequestMethod.POST)
	public String setLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session, @ModelAttribute("username") String username, @ModelAttribute("password") String password) {
		if(username.equals("admin") && password.equals("admin")){
			session.setAttribute("name", "Admin");
			return "SUCCESS";
		} else {
			return "FAILED";
		}
	}
	
	@RequestMapping(value={"/Logout"},method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();
		return "redirect:/Login";
	}
}
