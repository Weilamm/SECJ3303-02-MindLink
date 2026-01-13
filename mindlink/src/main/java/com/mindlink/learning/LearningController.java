package com.mindlink.learning;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mindlink.module.LearningModule;
import com.mindlink.module.ModuleService;

@Controller
public class LearningController {

    @Autowired
    private ModuleService moduleService;

    // This listens for the "/learning" URL from your Home Page
    @GetMapping("/learning")
    public String showLearningHub() {
        // 2. This opens the file at src/main/webapp/WEB-INF/learning/hub.jsp
        return "learning/hub"; 
    }

    // Student view: List all modules
    @GetMapping("/learning/modules")
    public String showModuleList(Model model) {
        model.addAttribute("modules", moduleService.getAllModules());
        return "learning/modules"; // Student view in learning folder
    }
    
    // Student view: View specific module
    @GetMapping("/learning/modules/view")
    public String showModuleView(@RequestParam(value = "id", required = false) String id, Model model) {
        if (id != null) {
            LearningModule module = moduleService.getModuleById(id);
            if (module != null) {
                model.addAttribute("module", module);
                return "learning/module-view";
            }
        }
        // Fallback: get first module if no ID provided
        var modules = moduleService.getAllModules();
        if (!modules.isEmpty()) {
            model.addAttribute("module", modules.get(0));
            return "learning/module-view";
        }
        return "redirect:/learning/modules";
    }
}