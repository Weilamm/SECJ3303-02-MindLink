package com.mindlink.module;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class ModuleService {
    
    private List<LearningModule> modules = new ArrayList<>();

    public ModuleService() {
        // Pre-load your existing modules
        modules.add(new LearningModule("Introduction to Mental Health", 
            "Learn the basics of mental health, reduce stigma, and understand emotional well-being.", 
            "mental-health-intro.png"));
            
        modules.add(new LearningModule("Emotional Awareness", 
            "Recognize your emotions and develop healthy strategies to manage them.", 
            "emotional-awareness.png"));
    }

    // READ
    public List<LearningModule> getAllModules() { return modules; }

    public LearningModule getModuleById(String id) {
        return modules.stream().filter(m -> m.getId().equals(id)).findFirst().orElse(null);
    }

    // CREATE / UPDATE
    public void saveModule(LearningModule module) {
        if (module.getId() == null || module.getId().isEmpty()) {
            // New Module
            modules.add(new LearningModule(module.getTitle(), module.getDescription(), module.getImagePath()));
        } else {
            // Update Existing
            for (int i = 0; i < modules.size(); i++) {
                if (modules.get(i).getId().equals(module.getId())) {
                    modules.set(i, module);
                    return;
                }
            }
        }
    }

    // DELETE
    public void deleteModule(String id) {
        modules.removeIf(m -> m.getId().equals(id));
    }
}