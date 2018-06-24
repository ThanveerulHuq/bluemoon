package com.sdms.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.sdms.entity.ClassInfo;
import com.sdms.entity.StudentYear;
import com.sdms.repository.ClassInfoRepo;
import com.sdms.repository.StudentYearRepo;

@Controller
public class ExcelReportsController {

	@Autowired
	StudentYearRepo studentYearRepo;

	@Autowired
	ClassInfoRepo classInfoRepo;

	@ResponseBody
	@RequestMapping(value = { "/DownloadBalance" }, method = RequestMethod.GET)
	public void getFile(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("academicYear") Long academicYear)
			throws IOException,
			org.apache.poi.openxml4j.exceptions.InvalidFormatException {
		String path = request.getSession().getServletContext()
				.getRealPath("/resources/template")
				+ "/BalanceReport.xls";
		System.out.println(path);
		try {
			Workbook workbook = WorkbookFactory.create(new File(path));
			HSSFSheet sheet = (HSSFSheet) workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();
			int[][] feeByClass = getData(academicYear);
			{
				int i = 0;
				while (i < feeByClass.length) {
					Row row = rowIterator.next();
					if (row.getRowNum() > 1) {
						int j = 0;
						while (j < feeByClass[i].length) {
							Cell cell = row.getCell(j + 1);
							if (cell == null) {
								cell = row.createCell(j + 1);
							}
							cell.setCellValue(feeByClass[i][j]);
							j++;
						}
						i++;
					}
				}
			}
			for (int i = 0; i < feeByClass[0].length; i++) {
				int total = 0;
				for (int j = 0; j < feeByClass.length; j++) {
					total += feeByClass[j][i];
				}
				Cell cell = sheet.getRow(feeByClass.length + 2).getCell(i + 1);
				if (cell == null) {
					cell = sheet.getRow(feeByClass.length + 2)
							.createCell(i + 1);
				}
				cell.setCellValue(total);
			}
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			workbook.write(bos);
			bos.close();

			byte[] file = bos.toByteArray();
			InputStream input = new ByteArrayInputStream(file);
			response.setContentLength((int) file.length);
			response.setHeader("Content-Disposition",
					"inline;filename=\"ClasswiseBalanceReport.xls\"");
			OutputStream out = response.getOutputStream();
			response.setContentType("application/octet-stream");
			IOUtils.copy(input, out);
			out.flush();
			out.close();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		}

	}

	private int[][] getData(Long academicYear) {
		List<ClassInfo> allClasses = classInfoRepo.findAll();
		int[][] feeByClass = new int[allClasses.size()][16];
		for (int i = 0; i < allClasses.size(); i++) {
			List<StudentYear> classStudents = studentYearRepo.getbyclassId(
					academicYear, allClasses.get(i).getClassId());
			int actualTerm = 0, paidTerm = 0, balanceTerm = 0;
			int actualBU = 0, paidBU = 0, balanceBU = 0;
			int actualVan = 0, paidVan = 0, balanceVan = 0;
			int actualExtra = 0, paidExtra = 0, balanceExtra = 0;
			int scholorship = 0;
			for (int j = 0; j < classStudents.size(); j++) {
				actualTerm += classStudents.get(j).getTermFee();
				paidTerm += classStudents.get(j).getPaidFee().getTermFee();
				actualBU += classStudents.get(j).getBookUniformFee();
				paidBU += classStudents.get(j).getPaidFee().getBookUniformFee();
				actualVan += classStudents.get(j).getVanFee();
				paidVan += classStudents.get(j).getPaidFee().getVanFee();
				actualExtra += classStudents.get(j).getExtraFee();
				paidExtra += classStudents.get(j).getPaidFee().getExtraFee();
				scholorship += classStudents.get(j).getScholorship();
			}
			balanceTerm = actualTerm - paidTerm;
			balanceBU = actualBU - paidBU;
			balanceVan = actualVan - paidVan;
			balanceExtra = actualExtra - paidExtra;
			int totalActual = actualTerm + actualBU + actualVan + actualExtra;
			int totalPaid = paidExtra + paidBU + paidVan + paidExtra;
			int totalBalance = balanceTerm + balanceBU + balanceVan
					+ balanceExtra;
			int[] feeTotals;
			feeTotals = new int[] { actualTerm, paidTerm, balanceTerm,
					actualBU, paidBU, balanceBU, actualVan, paidVan,
					balanceVan, actualExtra, paidExtra, balanceExtra,
					scholorship, totalActual, totalPaid, totalBalance };
			feeByClass[i] = feeTotals;
		}
		return feeByClass;
	}
}
