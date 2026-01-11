package com.mindlink.admin;

import com.mindlink.assessment.AssessmentQuestion;
import com.mindlink.assessment.AssessmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/assessment")
public class AdminAssessmentController {

    @Autowired
    private AssessmentService assessmentService;

    // List All Questions 
    @GetMapping("")
    public String listQuestions(Model model) {
        model.addAttribute("questions", assessmentService.getAllQuestions());
        return "admin/assessment_list";
    }

    // Show Add Form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("question", new AssessmentQuestion("", ""));
        return "admin/assessment_form";
    }

    // Show Edit Form
    @GetMapping("/edit")
    public String showEditForm(@RequestParam("id") String id, Model model) {
        AssessmentQuestion q = assessmentService.getQuestionById(id);
        model.addAttribute("question", q);
        return "admin/assessment_form";
    }

    // Save
    @PostMapping("/save")
    public String saveQuestion(@ModelAttribute AssessmentQuestion question) {
        assessmentService.saveQuestion(question);
        return "redirect:/admin/assessment";
    }

    // Delete
    @GetMapping("/delete")
    public String deleteQuestion(@RequestParam("id") String id) {
        assessmentService.deleteQuestion(id);
        return "redirect:/admin/assessment";
    }
}