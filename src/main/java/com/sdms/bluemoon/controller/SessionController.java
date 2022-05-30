package com.sdms.bluemoon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SessionController {
	public static Boolean checkSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws NullPointerException {
		try {
			if(session.getAttribute("name").equals("Admin")) {
				System.out.println("In Session");
				return true;
			}
		} catch (NullPointerException e) {
			session.invalidate();
			return false;
			
		}
		return false;
	}
}
