package com.sdms.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(value = { "/AddStudent" }, method = RequestMethod.GET)
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
		studentInfo.setStudentId(studentmodel.getStudentId());
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
		studentInfo.setActive(studentmodel.getActive());
		StudentsInfo student = studentInfoRepo.save(studentInfo);
		List<MultipartFile> images = studentmodel.getImages();
		if(!images.isEmpty()){
		for (int i = 0; i < images.size(); i++) {
			System.out.println(i);
			if (!images.get(i).isEmpty() ) {
				DocInfo docInfo = new DocInfo();
				docInfo.setStudentsInfo(student);
				try {
					docInfo.setsFile(images.get(i).getBytes());
					docInfo.setFileName(studentmodel.getFileNames().get(i));
					docInfoRepo.save(docInfo);
				} catch (IOException e) {
					e.printStackTrace();

				}
			}
		}
		}

		return "redirect:StudentInfo";
	}

	
	@RequestMapping(value = { "/EditStudent" }, method = RequestMethod.GET)
	public String editStudent(@ModelAttribute("student_id")Long studentId,HttpServletRequest request, HttpServletResponse response) {
		StudentInfoModel studentModel = new StudentInfoModel();
		System.out.println(studentId);
		StudentsInfo studentsInfo=studentInfoRepo.findOne(studentId);
		studentModel.setStudentId(studentId);
		studentModel.setAadharNo(studentsInfo.getAadharNo());
		studentModel.setAdmissionNo(studentsInfo.getAdmissionNo());
		studentModel.setEmisNo(studentsInfo.getEmisNo());
		studentModel.setName(studentsInfo.getName());
		studentModel.setGender(studentsInfo.getGender());
		studentModel.setAge(studentsInfo.getAge());
		studentModel.setDob(new Date(studentsInfo.getDob().getTime()));
		studentModel.setCommunity(studentsInfo.getCommunity());
		studentModel.setMotherTongue(studentsInfo.getMotherTongue());
		studentModel.setMobileNo1(studentsInfo.getMobileNo1());
		studentModel.setMobileNo2(studentsInfo.getMobileNo2());
		studentModel.setFatherName(studentsInfo.getFatherName());
		studentModel.setMotherName(studentsInfo.getMotherName());
		studentModel.setAddress(studentsInfo.getAddress());
		studentModel.setPreviousSchool(studentsInfo.getPreviousSchool());
		studentModel.setAdmissionDate(new Date(studentsInfo.getAdmissionDate().getTime()));
		studentModel.setActive(studentsInfo.getActive());
		List<DocInfo> docInfos=docInfoRepo.findByStudentId(studentId);
		List<String> fileNames = new ArrayList<String>();
		List<Long> fileIds= new ArrayList<Long>();
		for(int i=0; i<docInfos.size();i++) {
			DocInfo docInfo= docInfos.get(i);
			fileNames.add(docInfo.getFileName());
			fileIds.add(docInfo.getDocId());
		}
		studentModel.setFileNames(fileNames);
		studentModel.setFileIds(fileIds);
		request.setAttribute("StudentsInfo", studentModel);
		return "Library/Home";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/GetFile" }, method = RequestMethod.GET)
	public void getFile(@ModelAttribute("docId")Long docId, HttpServletRequest request, HttpServletResponse response) {
	    try {
	    	DocInfo docInfo =  docInfoRepo.findOne(docId);
	    	ByteArrayInputStream file = new ByteArrayInputStream(docInfo.getsFile());
	    	response.setContentType("application/octet-stream");
	        org.apache.commons.io.IOUtils.copy(file, response.getOutputStream());
	        response.flushBuffer();
	        file.close();
	      } catch (IOException ex) {
	        throw new RuntimeException("IOError writing file to output stream");
	      }
	}
	
}