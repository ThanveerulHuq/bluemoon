package com.sdms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdms.entity.StudentsInfo;

@Controller
public class HomeController {
	@RequestMapping(value={"/Home"},method = RequestMethod.GET)
	public String Home(HttpServletRequest request, HttpServletResponse response) {
		StudentsInfo studentsInfo= new StudentsInfo();
		request.setAttribute("StudentsInfo", studentsInfo);
		return "Library/Home";
	}
	
	@RequestMapping(value={"/SaveStudent"},method = RequestMethod.POST)
	public String SaveStudent(@ModelAttribute("StudentsInfo") StudentsInfo studentsinfo,HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println(studentsinfo.getName());
		
		return "Library/Home";
	}
}