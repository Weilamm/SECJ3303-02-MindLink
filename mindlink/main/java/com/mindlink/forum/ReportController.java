package com.mindlink.forum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Community Support - Report Controller (UC14)
 * Simple navigation mapping - just shows JSP files
 */
@Controller
@RequestMapping("/report")
public class ReportController {

    // URL: /report/table
    // JSP: WEB-INF/views/CommunitySupport/uc14_table.jsp
    @GetMapping("/table")
    public String showTable() {
        return "CommunitySupport/uc14_table";
    }

    // URL: /report/review
    // JSP: WEB-INF/views/CommunitySupport/uc14_review_report.jsp
    @GetMapping("/review")
    public String showReview() {
        return "CommunitySupport/uc14_review_report";
    }

    // URL: /report/view
    // JSP: WEB-INF/views/CommunitySupport/uc14_view_reported_forum.jsp
    @GetMapping("/view")
    public String showViewReport() {
        return "CommunitySupport/uc14_view_reported_forum";
    }
}