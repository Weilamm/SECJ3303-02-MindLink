package com.mindlink.assistant;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * AI Assistant - Tips Controller (UC11)
 * Simple navigation mapping - just shows JSP files
 */
@Controller
@RequestMapping("/ai")
public class TipsController {

    // URL: /ai/tips
    // JSP: WEB-INF/views/AIAssistant/uc11_tips.jsp
    @GetMapping("/tips")
    public String showTips() {
        return "assistant/tips";
    }
}