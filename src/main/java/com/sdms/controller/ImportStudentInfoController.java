package com.sdms.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
//import org.apache.poi.sl.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sdms.entity.AreaInfo;
import com.sdms.entity.DocInfo;
import com.sdms.entity.StudentsInfo;
import com.sdms.repository.AreaInfoRepo;
import com.sdms.repository.StudentsInfoRepo;

@Controller
public class ImportStudentInfoController {
	
	@Autowired
	StudentsInfoRepo studentInfoRepo;
	
	@Autowired
	AreaInfoRepo areaInfoRepo;
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value={"/ImportStudentsInfo"},method = RequestMethod.GET)
	public String importStudentsInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws EncryptedDocumentException, InvalidFormatException, IOException {
//		if(!SessionController.checkSession(request, response, session)) {
//			return "redirect:Login";
//		}
		
//		File initialFile = new File("C:/Users/ponnarsankar_annamar/Desktop/SDMS StudentInfo Upload.xls");
//		Workbook workbook = null;
//		try {
//			InputStream fileStream = new FileInputStream(initialFile);
//			workbook = WorkbookFactory.create(fs);
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		 Workbook workbook = WorkbookFactory.create(new File("C:/Users/ponnarsankar_annamar/Desktop/SDMS StudentInfo Upload.xls"));
		
		HSSFSheet sheet = (HSSFSheet) workbook.getSheetAt(0);
		Iterator<Row> rowIterator = sheet.iterator();
		rowIterator.next(); // Skip for header row
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
//            if(processRecordRow(row)) {
////            	sheet.removeRow(row);
//            } else {
//            	
//            }
        }
        
		return "ImportStudentsInfo";
	}
	
	private Boolean processRecordRow(Row row) {
		try{
			StudentsInfo studentInfo = new StudentsInfo();
			studentInfo.setName(formatCell(row.getCell(0)));
			studentInfo.setAadharNo(Long.parseUnsignedLong(formatCell(row.getCell(1))));
			studentInfo.setAdmissionNo(Long.parseUnsignedLong(formatCell(row.getCell(2))));
			studentInfo.setEmisNo(Long.parseUnsignedLong(formatCell(row.getCell(3))));
			String gender = formatCell(row.getCell(4));
			if(gender.toLowerCase().equals("male")){
				studentInfo.setGender("M");
			} else if(gender.toLowerCase().equals("female")) {
				studentInfo.setGender("F");
			}
			studentInfo.setAge(Long.parseUnsignedLong(formatCell(row.getCell(5))));
			studentInfo.setDob(new Timestamp(row.getCell(6).getDateCellValue().getTime()));
			studentInfo.setReligion(formatCell(row.getCell(7)));
			studentInfo.setCommunity(formatCell(row.getCell(8)));
			studentInfo.setCaste(formatCell(row.getCell(9)));
			studentInfo.setNationality(formatCell(row.getCell(10)));
			studentInfo.setMotherTongue(formatCell(row.getCell(11)));
			studentInfo.setMobileNo1(Long.parseUnsignedLong(formatCell(row.getCell(12))));
			studentInfo.setMobileNo2(Long.parseUnsignedLong(formatCell(row.getCell(13))));
			studentInfo.setFatherName(formatCell(row.getCell(14)));
			studentInfo.setMotherName(formatCell(row.getCell(15)));
			studentInfo.setAddress(formatCell(row.getCell(16)));
			studentInfo.setPreviousSchool(formatCell(row.getCell(17)));
			String active = formatCell(row.getCell(18));
			if(active.toLowerCase().equals("yes")){
				studentInfo.setActive("Y");
			} else if(active.toLowerCase().equals("no")) {
				studentInfo.setActive("N");
			}
			studentInfo.setAdmissionDate(new Timestamp(row.getCell(19).getDateCellValue().getTime()));
			String area = formatCell(row.getCell(20));
			if(area.toLowerCase().equals("salem")){
				area = "salem";
			} else if(area.toLowerCase().equals("omalur")) {
				area = "omalur";
			}
			try{
				AreaInfo areaInfo = areaInfoRepo.getAreaId(area);
				studentInfo.setAreaInfo(areaInfo);
			}catch (Exception e){
				e.printStackTrace();
			}
			studentInfo.setRemarks(formatCell(row.getCell(21)));
			studentInfoRepo.save(studentInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	@SuppressWarnings("deprecation")
	private String formatCell(Cell cell) {
		DataFormatter dataFormatter = new DataFormatter();
		String cellValue = "";
		try{
			cell.setCellType(Cell.CELL_TYPE_STRING);
			cellValue = dataFormatter.formatCellValue(cell);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cellValue;
	}
	
	@ResponseBody
	@RequestMapping(value={"/ImportFileStudentsInfo"},method = RequestMethod.POST)
	public String importFileStudentsInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam("file") MultipartFile file ) {
		
		HSSFWorkbook workbook;
		try {
			workbook = new HSSFWorkbook(file.getInputStream());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "FAIL";
		}
			HSSFSheet sheet = (HSSFSheet) workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();
			rowIterator.next(); // Skip for header row
			Boolean errFlag = false;
	        while (rowIterator.hasNext()) {
	            Row row = rowIterator.next();
	            if(processRecordRow(row)) {
	            	sheet.removeRow(row);
	            } else {
	            	errFlag = true;
	            }
	        if(errFlag) {
	        	try {
//	    			response.setHeader("Content-Disposition", "attachment;filename=SDMS_StudentInfo_Template.xls");
//	    			OutputStream out = response.getOutputStream();
//	    			response.setContentType("application/vnd.ms-excel");
//	    			workbook.write(out);
//	    			workbook.close();
//	    			out.flush();
//	    			out.close();
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	        }
        }
		
		return "FAIL";
	}
	
	@ResponseBody
	@RequestMapping(value={"/downloadTemplate"},method = RequestMethod.GET)
	public void downloadTemplate(HttpServletRequest request, HttpServletResponse response) {

		InputStream is = null;
		try {
			is = new FileInputStream(request.getContextPath() + "/resources/template/SDMS_StudentInfo_Template.xls");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	try {
			response.setHeader("Content-Disposition", "inline;filename=SDMS_StudentInfo_Template.xls");
			OutputStream out = response.getOutputStream();
			response.setContentType("application/octet-stream");
			IOUtils.copy(is, out);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
