package com.sdms.bluemoon.controller;

import com.sdms.bluemoon.entity.AcademicYear;
import com.sdms.bluemoon.entity.ClassInfo;
import com.sdms.bluemoon.entity.CommonFee;
import com.sdms.bluemoon.repository.AcademicYearRepo;
import com.sdms.bluemoon.repository.ClassInfoRepo;
import com.sdms.bluemoon.repository.CommonFeeRepo;
import com.sdms.bluemoon.utils.BlueMoonConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = BlueMoonConstants.PREFIX_URL)
public class TutionFeeController {

    @Autowired
    AcademicYearRepo academicYearRepo;

    @Autowired
    ClassInfoRepo classInfoRepo;

    @Autowired
    CommonFeeRepo commonFeeRepo;

    @RequestMapping(value = {"/TutionFeeForm"}, method = RequestMethod.GET)
    public String tutionFeeForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        if (!SessionController.checkSession(request, response, session)) {
            return "redirect:Login";
        }
        List<AcademicYear> academicYear = academicYearRepo.findAll();
        List<ClassInfo> classes = classInfoRepo.findAll();
        CommonFee commonFee = new CommonFee();
        request.setAttribute("academicYear", academicYear);
        request.setAttribute("classes", classes);
        request.setAttribute("CommonFee", commonFee);
        return "TutionFeeForm";
    }

    @RequestMapping(value = {"/EditTutionFee"}, method = RequestMethod.GET)
    public String editTutionFee(HttpServletRequest request, HttpServletResponse response,
                                @ModelAttribute("Feeid") Long Feeid, HttpSession session) {
        if (!SessionController.checkSession(request, response, session)) {
            return "redirect:Login";
        }
        List<AcademicYear> academicYear = academicYearRepo.findAll();
        List<ClassInfo> classes = classInfoRepo.findAll();
        CommonFee commonFee = commonFeeRepo.findById(Feeid).get();
        request.setAttribute("academicYear", academicYear);
        request.setAttribute("classes", classes);
        request.setAttribute("CommonFee", commonFee);
        return "TutionFeeForm";
    }

    @RequestMapping(value = {"/SetFee"}, method = RequestMethod.POST)
    public String setFee(HttpServletRequest request, HttpServletResponse response,
                         @ModelAttribute("CommonFee") CommonFee commonFee) {
        System.out.println(commonFee.getClassInfo().getClassId());
        commonFeeRepo.save(commonFee);
        return "redirect:TutionFee";
    }

    @RequestMapping(value = {"/TutionFee"}, method = RequestMethod.GET)
    public String tutionFee(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        if (!SessionController.checkSession(request, response, session)) {
            return "redirect:Login";
        }
        List<AcademicYear> academicYear = academicYearRepo.findAll();
        request.setAttribute("academicYear", academicYear);
        return "TutionFee";
    }

    @ResponseBody
    @RequestMapping(value = {"/getCommonFee"}, method = RequestMethod.GET)
    public List<CommonFee> getCommonFee(HttpServletRequest request, HttpServletResponse response,
                                        @ModelAttribute("academicYear") Long academicYear) {
        List<CommonFee> commonFee = commonFeeRepo.getFeeByYr(academicYear);
        return commonFee;
    }

}
