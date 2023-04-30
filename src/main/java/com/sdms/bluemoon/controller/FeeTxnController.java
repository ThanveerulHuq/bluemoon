package com.sdms.bluemoon.controller;

import com.sdms.bluemoon.entity.AcademicYear;
import com.sdms.bluemoon.entity.FeeTxn;
import com.sdms.bluemoon.entity.PaidFee;
import com.sdms.bluemoon.entity.StudentYear;
import com.sdms.bluemoon.model.FeeTxnModel;
import com.sdms.bluemoon.repository.AcademicYearRepo;
import com.sdms.bluemoon.repository.FeeTxnRepo;
import com.sdms.bluemoon.repository.PaidFeeRepo;
import com.sdms.bluemoon.repository.StudentYearRepo;
import com.sdms.bluemoon.utils.BlueMoonConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = BlueMoonConstants.PREFIX_URL)
public class FeeTxnController {

    @Autowired
    FeeTxnRepo feeTxnRepo;
    @Autowired
    StudentYearRepo studentYearRepo;
    @Autowired
    AcademicYearRepo academicYearRepo;
    @Autowired
    PaidFeeRepo paidFeeRepo;

    @RequestMapping(value = {"/FeeTxn"}, method = RequestMethod.GET)
    public String feeTxn(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        if (!SessionController.checkSession(request, response, session)) {
            return "redirect:Login";
        }
        FeeTxnModel feeTxnModel = new FeeTxnModel();
        List<AcademicYear> academicYear = academicYearRepo.findAll();
        request.setAttribute("academicYear", academicYear);
        request.setAttribute("FeeTxn", feeTxnModel);
        return "Library/FeeTxn";
    }

    @RequestMapping(value = {"/SaveFeeTxn"}, method = RequestMethod.POST)
    public String saveFeeTxn(@ModelAttribute("FeeTxn") FeeTxnModel feeTxnModel, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        FeeTxn feeTxn = new FeeTxn();
        StudentYear studentYear = studentYearRepo.getStudentById(feeTxnModel.getStudentYearId());
        List<FeeTxn> lastTxns = feeTxnRepo.findByStudentYearId(feeTxnModel.getStudentYearId());
        if (lastTxns.size() > 5) {
            lastTxns = lastTxns.subList(0, 4);
        }
        Collections.reverse(lastTxns);
        feeTxn.setStudentYear(studentYear);
        feeTxn.setSchoolFee(feeTxnModel.getSchoolFee());
        feeTxn.setBookFee(feeTxnModel.getBookFee());
        feeTxn.setUniformFee(feeTxnModel.getUniformFee());
        feeTxn.setVanFee(feeTxnModel.getVanFee());
        feeTxn.setAmountPaid(feeTxnModel.getAmountPaid());
        feeTxn.setPaymentDate(new Timestamp(feeTxnModel.getPaymentDate()));
        feeTxn.setRemarks(feeTxnModel.getRemarks());
        FeeTxn feeTxnSaved = feeTxnRepo.save(feeTxn);
        PaidFee paidFee = studentYear.getPaidFee();
        paidFee.setSchoolFee(paidFee.getSchoolFee() + feeTxn.getSchoolFee());
        paidFee.setBookFee(paidFee.getBookFee() + feeTxn.getBookFee());
        paidFee.setUniformFee(paidFee.getUniformFee() + feeTxn.getUniformFee());
        paidFee.setVanFee(paidFee.getVanFee() + feeTxn.getVanFee());
        paidFeeRepo.save(paidFee);
        redirectAttributes.addFlashAttribute("Print", feeTxnSaved);
        redirectAttributes.addFlashAttribute("lastTxns", lastTxns);
        return "redirect:PrintReceipt";
    }

    @RequestMapping(value = {"/PrintReceipt"}, method = RequestMethod.GET)
    public String printReceipt(HttpServletRequest request, HttpServletResponse response) {
        return "Library/FeeTxnPrint";
    }

    @RequestMapping(value = {"/FeeReport"}, method = RequestMethod.GET)
    public String feeReport(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        if (!SessionController.checkSession(request, response, session)) {
            return "redirect:Login";
        }
        return "Library/FeeReport";
    }

    @ResponseBody
    @RequestMapping(value = {"/GetFeeReport"}, method = RequestMethod.GET)
    public List getFeeReport(@ModelAttribute("startTime") String startTime, @ModelAttribute("endTime") String endTime, HttpServletRequest request, HttpServletResponse response) throws ParseException {
        List feeReport = new ArrayList();
        if (startTime.isEmpty() || endTime.isEmpty()) {
            feeReport = feeTxnRepo.findAll();
        } else {
            DateFormat dF = new SimpleDateFormat("dd-MM-yyyy");
            Date startDate = dF.parse(startTime);
            Date endDate = dF.parse(endTime);
            feeReport = feeTxnRepo.getFilterData(startDate, endDate);
        }
        return feeReport;
    }

    @ResponseBody
    @RequestMapping(value = {"/GetPaymentHistory"}, method = RequestMethod.GET)
    public List<FeeTxn> getFeeReportByStudent(@ModelAttribute("studentYearId") Long studentYearId, HttpServletRequest request, HttpServletResponse response) throws ParseException {
        if (studentYearId == null) return Collections.emptyList();
        return feeTxnRepo.findByStudentYearId(studentYearId);
    }

    @ResponseBody
    @RequestMapping(value = {"/getAllStudentyearq"}, method = RequestMethod.GET)
    public List<StudentYear> getAllStudentyearq(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("q") String q, @ModelAttribute("academicYear") Long academicYear) {
        return studentYearRepo.getstudentbyname(academicYear, q);
    }

    @RequestMapping(value = {"/RePrintReceipt"}, method = RequestMethod.GET)
    public String RePrintReceipt(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("id") Long id) {
        request.setAttribute("Print", feeTxnRepo.findById(id).get());
        return "Library/FeeRePrint";
    }


}
