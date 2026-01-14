package com.mindlink.admin;

import com.mindlink.assistant.model.Chatbot;
import com.mindlink.assistant.service.ChatbotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Admin Controller for Managing Chatbot Rules
 * Allows admin to create, read, update, and delete chatbot keyword-response rules
 */
@Controller
@RequestMapping("/admin/chatbot")
public class AdminChatbotController {

    @Autowired
    private ChatbotService chatbotService;

    // List all chatbot rules
    @GetMapping("")
    public String listChatbotRules(@RequestParam(value = "search", required = false) String search, Model model) {
        List<Chatbot> allRules = chatbotService.getAllChatbotRules();
        
        // Filter by search query if provided
        if (search != null && !search.trim().isEmpty()) {
            String searchLower = search.toLowerCase().trim();
            allRules = allRules.stream()
                .filter(rule -> {
                    // Search by ID
                    if (String.valueOf(rule.getId()).contains(searchLower)) {
                        return true;
                    }
                    // Search by keyword
                    if (rule.getKeyword() != null && rule.getKeyword().toLowerCase().contains(searchLower)) {
                        return true;
                    }
                    return false;
                })
                .collect(java.util.stream.Collectors.toList());
        }
        
        model.addAttribute("rules", allRules);
        model.addAttribute("searchQuery", search != null ? search : "");
        return "admin/chatbot_list";
    }

    // Show Add Form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("rule", new Chatbot());
        return "admin/chatbot_form";
    }

    // Show Edit Form
    @GetMapping("/edit")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        Chatbot rule = chatbotService.getChatbotRuleById(id);
        if (rule != null) {
            model.addAttribute("rule", rule);
        }
        return "admin/chatbot_form";
    }

    // Save (Create or Update)
    @PostMapping("/save")
    public String saveRule(@RequestParam(value = "id", required = false) Integer id,
                          @RequestParam("keyword") String keyword,
                          @RequestParam("response") String response) {
        if (id != null && id > 0) {
            // Update existing rule
            chatbotService.updateChatbotRule(id, keyword, response);
        } else {
            // Create new rule
            chatbotService.addChatbotRule(keyword, response);
        }
        return "redirect:/admin/chatbot";
    }

    // Delete
    @GetMapping("/delete")
    public String deleteRule(@RequestParam("id") int id) {
        chatbotService.deleteChatbotRule(id);
        return "redirect:/admin/chatbot";
    }
}

