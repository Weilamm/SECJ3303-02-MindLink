package com.mindlink.admin;

import com.mindlink.assistant.model.DailyTip;
import com.mindlink.assistant.service.DailyTipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Admin Controller for Managing Daily Tips
 * Allows admin to create, read, update, and delete daily mental health tips
 */
@Controller
@RequestMapping("/admin/tips")
public class AdminTipsController {

    @Autowired
    private DailyTipService dailyTipService;

    // List all daily tips
    @GetMapping("")
    public String listTips(@RequestParam(value = "search", required = false) String search, Model model) {
        List<DailyTip> allTips = dailyTipService.getAllTips();
        
        // Filter by search query if provided
        if (search != null && !search.trim().isEmpty()) {
            String searchLower = search.toLowerCase().trim();
            allTips = allTips.stream()
                .filter(tip -> {
                    // Search by ID
                    if (String.valueOf(tip.getId()).contains(searchLower)) {
                        return true;
                    }
                    // Search by title
                    if (tip.getTitle() != null && tip.getTitle().toLowerCase().contains(searchLower)) {
                        return true;
                    }
                    return false;
                })
                .collect(java.util.stream.Collectors.toList());
        }
        
        model.addAttribute("tips", allTips);
        model.addAttribute("searchQuery", search != null ? search : "");
        return "admin/tips_list";
    }

    // Show Add Form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("tip", new DailyTip());
        return "admin/tips_form";
    }

    // Show Edit Form
    @GetMapping("/edit")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        DailyTip tip = dailyTipService.getTipById(id);
        if (tip != null) {
            model.addAttribute("tip", tip);
        }
        return "admin/tips_form";
    }

    // Save (Create or Update)
    @PostMapping("/save")
    public String saveTip(@RequestParam(value = "id", required = false) Integer id,
                         @RequestParam("title") String title,
                         @RequestParam("content") String content) {
        if (id != null && id > 0) {
            // Update existing tip
            dailyTipService.updateTip(id, title, content);
        } else {
            // Create new tip
            dailyTipService.addTip(title, content);
        }
        return "redirect:/admin/tips";
    }

    // Delete
    @GetMapping("/delete")
    public String deleteTip(@RequestParam("id") int id) {
        dailyTipService.deleteTip(id);
        return "redirect:/admin/tips";
    }
}

