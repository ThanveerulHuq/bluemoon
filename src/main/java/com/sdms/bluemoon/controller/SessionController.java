package com.sdms.bluemoon.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ResponseBody;


public class SessionController {
	public static Boolean checkSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws NullPointerException {
		try {
			if(session.getAttribute("name").equals("Admin")) {
				System.out.println("In Session");
				return true;
			}
		} catch (NullPointerException e) {
			session.invalidate();
			//response.sendRedirect("/SDMS/Login");
			return false;
			
		}
		return false;
	}
}
