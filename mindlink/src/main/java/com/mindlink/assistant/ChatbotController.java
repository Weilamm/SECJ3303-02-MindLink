package com.mindlink.assistant;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * AI Assistant - Chatbot Controller (UC10)
 * Simple navigation mapping - just shows JSP files
 */
@Controller
@RequestMapping("/ai")
public class ChatbotController {

    // URL: /ai/chatbot
    // JSP: WEB-INF/views/AIAssistant/uc10_chatbot.jsp
    @GetMapping("/chatbot")
    public String showChatbot() {
        return "assistant/chatbot";
    }
}