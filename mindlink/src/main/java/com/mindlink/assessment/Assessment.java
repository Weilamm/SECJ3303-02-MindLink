package com.mindlink.assessment;

import java.util.List;

public class Assessment {
    private int id;
    private String title;
    private String questionText;
    private String questionType;
    private List<AssessmentOption> options;

    public Assessment() {
    }

    public Assessment(int id, String title, String questionText, String questionType) {
        this.id = id;
        this.title = title;
        this.questionText = questionText;
        this.questionType = questionType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public List<AssessmentOption> getOptions() {
        return options;
    }

    public void setOptions(List<AssessmentOption> options) {
        this.options = options;
    }
}
