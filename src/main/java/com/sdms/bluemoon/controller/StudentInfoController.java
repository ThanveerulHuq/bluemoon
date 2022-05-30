package com.sdms.bluemoon.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdms.bluemoon.entity.DocInfo;
import com.sdms.bluemoon.entity.StudentsInfo;
import com.sdms.bluemoon.repository.DocInfoRepo;
import com.sdms.bluemoon.repository.StudentsInfoRepo;
import com.sdms.bluemoon.utils.BlueMoonConstants;


@Controller
@RequestMapping(value = BlueMoonConstants.PREFIX_URL)
public class StudentInfoController {
	
	@Autowired
	StudentsInfoRepo studentInfoRepo;
	
	@Autowired
	DocInfoRepo docInfoRepo;

	@RequestMapping(value={"/StudentInfo"},method = RequestMethod.GET)
	public String studentInfo(ModelMap map,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}
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

	@RequestMapping(value={"/PrintStudentInfo"},method = RequestMethod.GET)
	public String printStudentInfo(@ModelAttribute("studentId") Long studentId, HttpServletRequest request, HttpServletResponse response) {
		StudentsInfo studentInfo = studentInfoRepo.findById(studentId).get();
		request.setAttribute("Print", studentInfo);
		DocInfo docInfo = docInfoRepo.getProfilePhoto(studentId);
		try{
			request.setAttribute("PhotoId", docInfo.getDocId());
		} catch (NullPointerException e) {
			request.setAttribute("PhotoId", "");
		}
		return "Library/StudentInfoPrint";
	}

}
