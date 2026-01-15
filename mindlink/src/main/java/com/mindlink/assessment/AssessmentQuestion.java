package com.mindlink.assessment;

import java.util.UUID;

//assessment question java
public class AssessmentQuestion {
    private String id;
    private String questionText;
    private String options;

    public AssessmentQuestion(String questionText, String options) {
        this.id = UUID.randomUUID().toString();
        this.questionText = questionText;
        this.options = options;
    }

    public AssessmentQuestion(String id, String questionText, String options) {
        this.id = id;
        this.questionText = questionText;
        this.options = options;
    }

    public String getId() { return id; }
    public String getQuestionText() { return questionText; }
    public String getOptions() { return options; }

    public void setId(String id) { this.id = id; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }
    public void setOptions(String options) { this.options = options; }
}