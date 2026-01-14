package com.mindlink.assessment;

import com.mindlink.assessment.dao.AssessmentDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/assessment")
public class AssessmentController {

    @Autowired
    private AssessmentDao assessmentDao;

    private static final int PAGE_SIZE = 4;

    @GetMapping
    public String showWelcomePage() {
        return "assessment/welcome";
    }

    @GetMapping("/select-module")
    public String dashboard(Model model, HttpSession session) {
        // Clear previous session data when starting a new test
        session.removeAttribute("userAnswers");
        
        // Fetch titles like "Stress Test" and "Happiness Check" from the database
        List<String> modules = assessmentDao.findAllAssessmentTitles(); 
        
        model.addAttribute("modules", modules);
        return "assessment/dashboard";
    }

    @GetMapping("/questions")
    public String showQuestions(@RequestParam("title") String title, 
                                @RequestParam(value = "page", defaultValue = "1") int page, 
                                Model model) {
        
        int totalQuestions = assessmentDao.countByTitle(title);
        int totalPages = (int) Math.ceil((double) totalQuestions / PAGE_SIZE);
        int offset = (page - 1) * PAGE_SIZE;

        List<Assessment> questions = assessmentDao.findByTitlePaged(title, offset, PAGE_SIZE);
        
        model.addAttribute("questions", questions);
        model.addAttribute("title", title);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        
        return "assessment/question";
    }

    @PostMapping("/submit")
    public String processStep(HttpServletRequest request, 
                              @RequestParam("title") String title,
                              @RequestParam("currentPage") int currentPage,
                              @RequestParam("totalPages") int totalPages,
                              HttpSession session, Model model) {

        // 1. Get or create the answer map in the session
        Map<Integer, Integer> answers = (Map<Integer, Integer>) session.getAttribute("userAnswers");
        if (answers == null) {
            answers = new HashMap<>();
        }

        // 2. Capture answers from the current page
        Enumeration<String> params = request.getParameterNames();
        while (params.hasMoreElements()) {
            String paramName = params.nextElement();
            if (paramName.startsWith("q_")) {
                int qId = Integer.parseInt(paramName.substring(2));
                int score = Integer.parseInt(request.getParameter(paramName));
                answers.put(qId, score);
            }
        }
        session.setAttribute("userAnswers", answers);

        // 3. Navigation Logic
        if (currentPage < totalPages) {
            return "redirect:/assessment/questions?title=" + title + "&page=" + (currentPage + 1);
        }

        // 4. Final Calculation (Normalized to 100)
        return calculateFinalScore(title, answers, model);
    }

    private String calculateFinalScore(String title, Map<Integer, Integer> answers, Model model) {
        int userScore = 0;
        int maxPossible = 0;
        List<Assessment> allQuestions = assessmentDao.findByTitle(title);

        for (Assessment q : allQuestions) {
            // Find the highest possible score for each question in this set
            int qMax = q.getOptions().stream().mapToInt(AssessmentOption::getScoreValue).max().orElse(0);
            maxPossible += qMax;
            
            // Add user's selected score
            userScore += answers.getOrDefault(q.getId(), 0);
        }

        // Formula: (Total Scored / Max Possible) * 100
        int finalScore = (maxPossible > 0) ? (userScore * 100 / maxPossible) : 0;
        
        model.addAttribute("score", finalScore);
        
        // Interpretation Logic based on 100-point scale
        if (finalScore < 30) {
            model.addAttribute("suggestionTitle", "Doing Well!");
            model.addAttribute("interpretation", "Your results suggest a stable mental state. Keep maintaining your healthy routines.");
            model.addAttribute("suggestions", List.of("Continue regular exercise", "Practice daily gratitude"));
        } else if (finalScore < 70) {
            model.addAttribute("suggestionTitle", "Moderate Stress");
            model.addAttribute("interpretation", "You may be feeling overwhelmed. It's a good time to slow down.");
            model.addAttribute("suggestions", List.of("Try guided meditation", "Ensure 8 hours of sleep", "Limit social media"));
        } else {
            model.addAttribute("suggestionTitle", "Attention Needed");
            model.addAttribute("interpretation", "Your score indicates high distress. Please consider reaching out for support.");
            model.addAttribute("suggestions", List.of("Speak with our campus counselor", "Schedule a medical check-up", "Reach out to a trusted friend"));
        }

        return "assessment/result";
    }
}