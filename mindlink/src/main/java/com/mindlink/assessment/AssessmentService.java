package com.mindlink.assessment;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class AssessmentService {
    
    private List<AssessmentQuestion> questions = new ArrayList<>();

    public AssessmentService() {
        // Pre-load data from your screenshot "UC07 Update Asessment.png"
        questions.add(new AssessmentQuestion("Are you taking any medications?", "Prescribed Medications;Over the Counter Supplements;I'm not taking any;Prefer not to say"));
        questions.add(new AssessmentQuestion("Do you have other mental health symptoms?", "#Social Withdrawal;#Feeling Numbness;#Feeling Sad;#Depressed;#Angry"));
        questions.add(new AssessmentQuestion("What's your health goal for today?", "I wanna reduce stress;I wanna try AI;I want to cope with trauma;I want to be a better person"));
    }

    public List<AssessmentQuestion> getAllQuestions() { return questions; }

    public AssessmentQuestion getQuestionById(String id) {
        return questions.stream().filter(q -> q.getId().equals(id)).findFirst().orElse(null);
    }

    public void saveQuestion(AssessmentQuestion q) {
        if (q.getId() == null || q.getId().isEmpty()) {
            questions.add(new AssessmentQuestion(q.getQuestionText(), q.getOptions()));
        } else {
            for (int i = 0; i < questions.size(); i++) {
                if (questions.get(i).getId().equals(q.getId())) {
                    questions.set(i, q);
                    return;
                }
            }
        }
    }

    public void deleteQuestion(String id) {
        questions.removeIf(q -> q.getId().equals(id));
    }
}