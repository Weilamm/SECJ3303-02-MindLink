package com.mindlink.assessment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import com.mindlink.assessment.dao.AssessmentDao;

@Controller

@RequestMapping("/admin/assessment")
public class AdminAssessmentController {

    @Autowired
    private AssessmentDao assessmentDao;

    @GetMapping
    public String listQuestions(Model model) {
        List<Assessment> questions = assessmentDao.findAll();
        // Grouping might be handled in backend, but flat list is fine for now
        model.addAttribute("questions", questions);
        return "admin/assessment_list";
    }

    @GetMapping("/add")
    public String addQuestionForm(Model model) {
        Assessment assessment = new Assessment();
        // Initialize with default values or empty list if needed
        model.addAttribute("assessment", assessment);
        return "admin/assessment_form";
    }

    @PostMapping("/save")
    public String saveQuestion(@ModelAttribute Assessment assessment) {
        // Spring binds nested list options if names are options[0].optionText etc.
        // We ensure database integrity
        assessmentDao.save(assessment);
        return "redirect:/admin/assessment";
    }

    @GetMapping("/edit")
    public String editQuestionForm(@RequestParam("id") int id, Model model) {
        Assessment assessment = assessmentDao.findById(id);
        model.addAttribute("assessment", assessment);
        return "admin/assessment_form";
    }

    @PostMapping("/update")
    public String updateQuestion(@ModelAttribute Assessment assessment) {
        assessmentDao.update(assessment);
        return "redirect:/admin/assessment";
    }

    @GetMapping("/delete")
    public String deleteQuestion(@RequestParam("id") int id) {
        assessmentDao.delete(id);
        return "redirect:/admin/assessment";
    }
}
