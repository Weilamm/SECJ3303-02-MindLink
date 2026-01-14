package com.mindlink.learning;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mindlink.module.LearningModule;
import com.mindlink.module.ModuleService;
import com.mindlink.module.UserProgress;

import jakarta.servlet.http.HttpSession;

@Controller
public class LearningController {

    @Autowired
    private ModuleService moduleService;

    private String getStudentId(HttpSession session) {
        // In a real app, retrieve from session. For now, hardcode to S001.
        return "S001";
    }

    // This listens for the "/learning" URL from your Home Page
    @GetMapping("/learning")
    public String showLearningHub() {
        return "learning/hub";
    }

    // Student view: List all modules
    @GetMapping("/learning/modules")
    public String showModuleList(Model model, HttpSession session) {
        String studentId = getStudentId(session);
        List<LearningModule> modules = moduleService.getAllModules();

        // Calculate progress for each module
        for (LearningModule m : modules) {
            int percent = moduleService.getModuleProgressPercentage(studentId, m.getModuleId());
            m.setProgressPercentage(percent);
        }

        model.addAttribute("modules", modules);
        return "learning/modules"; // Student view in learning folder
    }

    // Student view: View specific module
    @GetMapping("/learning/modules/view")
    public String showModuleView(@RequestParam(value = "id", required = false) String id, Model model,
            HttpSession session) {
        String studentId = getStudentId(session);

        if (id != null) {
            LearningModule module = moduleService.getModuleById(id);
            if (module != null) {
                // Get progress percentage
                int percent = moduleService.getModuleProgressPercentage(studentId, module.getModuleId());
                module.setProgressPercentage(percent);

                // Get completed questions for UI buttons
                List<UserProgress> progressList = moduleService.getStudentProgressForModule(studentId,
                        module.getModuleId());
                Set<Integer> completedQuestionIds = progressList.stream()
                        .map(UserProgress::getQuestionId)
                        .collect(Collectors.toSet());

                model.addAttribute("module", module);
                model.addAttribute("completedQuestions", completedQuestionIds);

                return "learning/module-view";
            }
        }
        // Fallback: get first module if no ID provided
        var modules = moduleService.getAllModules();
        if (!modules.isEmpty()) {
            return "redirect:/learning/modules/view?id=" + modules.get(0).getModuleId();
        }
        return "redirect:/learning/modules";
    }

    // AJAX Endpoint to save progress
    @PostMapping("/learning/modules/progress/save")
    @ResponseBody
    public Map<String, Object> saveProgress(@RequestParam("moduleId") int moduleId,
            @RequestParam("questionId") int questionId,
            HttpSession session) {
        String studentId = getStudentId(session);
        moduleService.markQuestionAsDone(studentId, moduleId, questionId);

        // Return new progress
        int newPercent = moduleService.getModuleProgressPercentage(studentId, moduleId);

        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("newPercentage", newPercent);

        return response;
    }
}