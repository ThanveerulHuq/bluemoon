package com.sdms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sdms.entity.AreaInfo;
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
		if(!SessionController.checkSession(request, response, session)) {
			return "redirect:Login";
		}        
		return "ImportStudentsInfo";
	}
	
	private Boolean processRecordRow(Row row) {
		try{
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
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
			Date dobTime = dateFormat.parse(formatCell(row.getCell(6)));			
			studentInfo.setDob(new Timestamp(dobTime.getTime()));
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
			Date admTime = dateFormat.parse(formatCell(row.getCell(19)));
			studentInfo.setAdmissionDate(new Timestamp(admTime.getTime()));
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
			System.out.println("saving row:");
			studentInfoRepo.save(studentInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@SuppressWarnings("deprecation")
	private String formatCell(Cell cell) throws Exception {
		DataFormatter dataFormatter = new DataFormatter();
		String cellValue = "";
		cell.setCellType(Cell.CELL_TYPE_STRING);
		cellValue = dataFormatter.formatCellValue(cell);
		return cellValue;
	}
	
	@ResponseBody
	@RequestMapping(value={"/ImportFileStudentsInfo"},method = RequestMethod.POST)
	public String importFileStudentsInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam("file") MultipartFile file ) {
		
		HSSFWorkbook workbook = null;
		try {
			workbook = new HSSFWorkbook(file.getInputStream());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HSSFSheet sheet = (HSSFSheet) workbook.getSheetAt(0);
		Boolean errFlag = false;
		System.out.println(sheet.getLastRowNum());
		for(int i = 1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if(processRecordRow(row)) {
				System.out.println("Removing row: " + i);
				//sheet.removeRow(sheet.getRow(i));
				sheet.shiftRows(row.getRowNum() + 1, sheet.getLastRowNum() + 1, -1);
		        i--;
			} else {
				System.out.println("Error row: " + i);
				errFlag = true;
			}
		}
        if(errFlag) {
        	try {
        		File errFile = new File("SDMS_StudentInfo_Error.xls");
        		if(errFile.exists()){
        			errFile.delete();
        		}
        		FileOutputStream out = new FileOutputStream("SDMS_StudentInfo_Error.xls");
    			workbook.write(out);
    			workbook.close();
    			out.close();
    			return errFile.getCanonicalPath();
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
        }
		return "FAIL";
	}
	
	@ResponseBody
	@RequestMapping(value={"/downloadError"},method = RequestMethod.GET)
	public void downloadError(HttpServletRequest request, HttpServletResponse response, @RequestParam("path") String path) {

		InputStream is = null;
		try {
			is = new FileInputStream(path);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	try {
			response.setHeader("Content-Disposition", "inline;filename=SDMS_StudentInfo_Error.xls");
			OutputStream out = response.getOutputStream();
			response.setContentType("application/vnd.ms-excel");
			IOUtils.copy(is, out);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
