package com.sanmina.webapps.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@RequestMapping(value={"/Home"},method = RequestMethod.GET)
	public String Home(@RequestParam(value="hm_desc", required=false) String hm_desc,HttpServletRequest request, HttpServletResponse response) {
		return "Library/Home";
	}
	@RequestMapping(value={"/Admin"},method = RequestMethod.GET)
	public String Admin(HttpServletRequest request, HttpServletResponse response) {
		return "Admin/Admin";
	}
}