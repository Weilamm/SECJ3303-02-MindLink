package com.mindlink.admin;

import com.mindlink.module.LearningModule;
import com.mindlink.module.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/modules")
public class AdminModuleController {

    @Autowired
    private ModuleService moduleService;

    // 1. List all modules
    @GetMapping("")
    public String listModules(Model model) {
        model.addAttribute("modules", moduleService.getAllModules());
        return "admin/module_list";
    }

    // 2. Show Add Form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("module", new LearningModule("", "", ""));
        return "admin/module_form";
    }

    // 3. Show Edit Form
    @GetMapping("/edit")
    public String showEditForm(@RequestParam("id") String id, Model model) {
        LearningModule module = moduleService.getModuleById(id);
        model.addAttribute("module", module);
        return "admin/module_form";
    }

    // 4. Save (Create or Update)
    @PostMapping("/save")
    public String saveModule(@ModelAttribute LearningModule module) {
        moduleService.saveModule(module);
        return "redirect:/admin/modules";
    }

    // 5. Delete
    @GetMapping("/delete")
    public String deleteModule(@RequestParam("id") String id) {
        moduleService.deleteModule(id);
        return "redirect:/admin/modules";
    }
}
