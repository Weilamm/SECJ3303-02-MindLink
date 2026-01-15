package com.mindlink.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

import com.mindlink.admin.dao.AdminAssessmentDao;
import com.mindlink.admin.dao.AssesModuleDao;

@Controller
@RequestMapping("/admin/assessment")
public class AdminAssessmentController {

    @Autowired
    private AdminAssessmentDao assessmentDao;

    @Autowired
    private AssesModuleDao moduleDao; 

    // Fetches unique "Modules" from the assessment table
    @GetMapping
    public String selectModule(Model model) {
        model.addAttribute("modules", moduleDao.findAll());
        return "admin/assessment_module_select";
    }

    @GetMapping("/list")
    public String listQuestions(@RequestParam("moduleId") int moduleId, Model model) {
        List<AdminAssessment> questions = assessmentDao.findByModuleId(moduleId);
        model.addAttribute("questions", questions);
        model.addAttribute("selectedModuleId", moduleId);
        return "admin/assessment_list";
    }

    @GetMapping("/add")
    public String addQuestionForm(@RequestParam("moduleId") int moduleId, Model model) {
        AdminAssessment assessment = new AdminAssessment();
        assessment.setModuleId(moduleId); 
        model.addAttribute("assessment", assessment);
        return "admin/assessment_form";
    }

    @PostMapping("/save")
    public String saveQuestion(@ModelAttribute AdminAssessment assessment) {
        assessmentDao.save(assessment);
        return "redirect:/admin/assessment/list?moduleId=" + assessment.getModuleId();
    }

    @GetMapping("/edit")
    public String editQuestionForm(@RequestParam("id") int id, Model model) {
        AdminAssessment assessment = assessmentDao.findById(id);
        model.addAttribute("assessment", assessment);
        return "admin/assessment_form";
    }

    @PostMapping("/update")
    public String updateQuestion(@ModelAttribute AdminAssessment assessment) {
        assessmentDao.update(assessment);
        return "redirect:/admin/assessment/list?moduleId=" + assessment.getModuleId();
    }

    @GetMapping("/delete")
    public String deleteQuestion(@RequestParam("id") int id) {
        AdminAssessment a = assessmentDao.findById(id);
        int moduleId = (a != null) ? a.getModuleId() : 0;
        assessmentDao.delete(id);
        return "redirect:/admin/assessment/list?moduleId=" + moduleId;
    }
}