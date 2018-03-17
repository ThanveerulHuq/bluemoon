package com.sdms.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.sdms.entity.DocInfo;
import com.sdms.entity.StudentsInfo;
import com.sdms.model.StudentInfoModel;
import com.sdms.repository.DocInfoRepo;
import com.sdms.repository.StudentsInfoRepo;

@Controller
public class HomeController {

	@Autowired
	StudentsInfoRepo studentInfoRepo;

	@Autowired
	DocInfoRepo docInfoRepo;

	@RequestMapping(value = { "/Home" }, method = RequestMethod.GET)
	public String Home(HttpServletRequest request, HttpServletResponse response) {
		StudentInfoModel studentsInfo = new StudentInfoModel();
		request.setAttribute("StudentsInfo", studentsInfo);
		return "Library/Home";
	}

	@RequestMapping(value = { "/SaveStudent" }, method = RequestMethod.POST)
	public String SaveStudent(
			@ModelAttribute("StudentsInfo") StudentInfoModel studentmodel,
			HttpServletRequest request, HttpServletResponse response) {
		StudentsInfo studentInfo = new StudentsInfo();
		// studentInfo.setStudentId((long)0);
		studentInfo.setAadharNo(studentmodel.getAadharNo());
		studentInfo.setAdmissionNo(studentmodel.getAdmissionNo());
		studentInfo.setEmisNo(studentmodel.getEmisNo());
		studentInfo.setName(studentmodel.getName());
		studentInfo.setGender(studentmodel.getGender());
		studentInfo.setAge(studentmodel.getAge());
		studentInfo.setDob(new Timestamp(studentmodel.getDob().getTime()));
		studentInfo.setCommunity(studentmodel.getCommunity());
		studentInfo.setMotherTongue(studentmodel.getMotherTongue());
		studentInfo.setMobileNo1(studentmodel.getMobileNo1());
		studentInfo.setMobileNo2(studentmodel.getMobileNo2());
		studentInfo.setFatherName(studentmodel.getFatherName());
		studentInfo.setMotherName(studentmodel.getMotherName());
		studentInfo.setAddress(studentmodel.getAddress());
		studentInfo.setPreviousSchool(studentmodel.getPreviousSchool());
		studentInfo.setAdmissionDate(new Timestamp(studentmodel
				.getAdmissionDate().getTime()));
		studentInfo.setActive("Y");
		StudentsInfo student = studentInfoRepo.save(studentInfo);
		List<MultipartFile> images = studentmodel.getImages();
		for (int i = 0; i < images.size(); i++) {
			if (!images.get(i).isEmpty()) {
				DocInfo docInfo = new DocInfo();
				docInfo.setStudentsInfo(student);
				try {
					docInfo.setsFile(images.get(i).getBytes());
					docInfoRepo.save(docInfo);
				} catch (IOException e) {
					e.printStackTrace();

				}
			}
		}

		return "Library/Home";
	}

}