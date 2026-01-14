package com.mindlink.usermanagement.controller;

import com.mindlink.usermanagement.model.Counselor;
import com.mindlink.usermanagement.service.UserManagementCounselorService;import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/user-management/counselors")
public class CounselorManagementController {

    @Autowired
    private UserManagementCounselorService counselorService;

    // Fragment for embedding
    @GetMapping("/fragment")
    public String listCounselorsFragment(Model model) {
        List<Counselor> counselors = counselorService.getAllCounselors();
        model.addAttribute("counselors", counselors);
        return "admin/userCRUD/counselor-list-fragment";
    }

    @GetMapping("/new")
    public String showNewCounselorForm(Model model) {
        model.addAttribute("counselor", new Counselor());
        return "admin/userCRUD/counselor-form";
    }

    @GetMapping("/edit/{id}")
    public String showEditCounselorForm(@PathVariable String id, Model model, RedirectAttributes redirectAttributes) {
        return counselorService.getCounselorById(id)
                .map(counselor -> {
                    model.addAttribute("counselor", counselor);
                    return "admin/userCRUD/counselor-form";
                })
                .orElseGet(() -> {
                    redirectAttributes.addFlashAttribute("error", "Counselor not found");
                    return "redirect:/admin/user-management/students";
                });
    }

    @PostMapping("/save")
    public String saveCounselor(@ModelAttribute Counselor counselor, RedirectAttributes redirectAttributes) {
        try {
            counselorService.saveCounselor(counselor);
            redirectAttributes.addFlashAttribute("success",
                    counselor.getCounselorId() != null && !counselor.getCounselorId().isEmpty()
                            ? "Counselor updated successfully"
                            : "Counselor created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error saving counselor: " + e.getMessage());
        }
        return "redirect:/admin/user-management/students"; // Redirect back to student list
    }

    @GetMapping("/delete/{id}")
    public String deleteCounselor(@PathVariable String id, RedirectAttributes redirectAttributes) {
        try {
            counselorService.deleteCounselor(id);
            redirectAttributes.addFlashAttribute("success", "Counselor deleted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error deleting counselor: " + e.getMessage());
        }
        return "redirect:/admin/user-management/students"; // Redirect back to student list
    }
}
