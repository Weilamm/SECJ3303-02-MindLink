package com.mindlink.assistant.model;

public class Chatbot {
    private int id;
    private String keyword;
    private String response;

    public Chatbot() {
    }

    public Chatbot(int id, String keyword, String response) {
        this.id = id;
        this.keyword = keyword;
        this.response = response;
    }

    public Chatbot(String keyword, String response) {
        this.keyword = keyword;
        this.response = response;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}

