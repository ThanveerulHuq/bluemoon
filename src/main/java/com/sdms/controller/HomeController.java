package com.sdms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@RequestMapping(value={"/Home"},method = RequestMethod.GET)
	public String Home(HttpServletRequest request, HttpServletResponse response) {
		return "Library/Home";
	}
}