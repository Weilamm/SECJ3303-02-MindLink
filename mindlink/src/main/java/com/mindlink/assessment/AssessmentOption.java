package com.mindlink.assessment;

public class AssessmentOption {
    private int optionId;
    private int assessmentId;
    private String optionText;
    private int scoreValue;

    public AssessmentOption() {
    }

    public AssessmentOption(int optionId, int assessmentId, String optionText, int scoreValue) {
        this.optionId = optionId;
        this.assessmentId = assessmentId;
        this.optionText = optionText;
        this.scoreValue = scoreValue;
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public int getAssessmentId() {
        return assessmentId;
    }

    public void setAssessmentId(int assessmentId) {
        this.assessmentId = assessmentId;
    }

    public String getOptionText() {
        return optionText;
    }

    public void setOptionText(String optionText) {
        this.optionText = optionText;
    }

    public int getScoreValue() {
        return scoreValue;
    }

    public void setScoreValue(int scoreValue) {
        this.scoreValue = scoreValue;
    }
}
