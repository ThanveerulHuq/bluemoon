package com.sdms.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdms.entity.StudentsInfo;
import com.sdms.repository.StudentsInfoRepo;


@Controller
public class StudentInfoController {
	
	@Autowired
	StudentsInfoRepo studentInfoRepo;

	@RequestMapping(value={"/StudentInfo"},method = RequestMethod.GET)
	public String studentInfo(ModelMap map,HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("dummy", dummy);
		return "Library/StudentInfo";
	}
	
	@ResponseBody
	@RequestMapping(value={"/GetStudentInfo"},method = RequestMethod.GET)
	public List getStudentInfo(HttpServletRequest request, HttpServletResponse response) {
		List<StudentsInfo> studentInfoList = new ArrayList<StudentsInfo>();
		studentInfoList = studentInfoRepo.findAll();
		
		//TODO: Dynamic column names to json object in grid 
//		List responseList = new ArrayList();
//		List columns = new ArrayList();
//		Iterator studentInfoItr = studentInfoList.iterator();
//		StudentsInfo studentInfoObj = (StudentsInfo)studentInfoItr.next();
//		studentInfoObj.getClass().getDeclaredFields();
		
		//TODO: handle sorting and filtering
		
		return studentInfoList;
	}


}
