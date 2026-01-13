package com.mindlink.module;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindlink.module.dao.ModuleDao;
import com.mindlink.module.dao.ModuleQuestionDao;

@Service
public class ModuleService {
    
    @Autowired
    private ModuleDao moduleDao;

    @Autowired
    private ModuleQuestionDao moduleQuestionDao;

    // READ
    public List<LearningModule> getAllModules() {
        List<LearningModule> modules = moduleDao.findAll();
        // Load questions for each module
        for (LearningModule module : modules) {
            List<ModuleQuestion> questions = moduleQuestionDao.findByModuleId(module.getModuleId());
            module.setQuestions(questions);
        }
        return modules;
    }

    public LearningModule getModuleById(String id) {
        try {
            int moduleId = Integer.parseInt(id);
            Optional<LearningModule> moduleOpt = moduleDao.findById(moduleId);
            if (moduleOpt.isPresent()) {
                LearningModule module = moduleOpt.get();
                List<ModuleQuestion> questions = moduleQuestionDao.findByModuleId(moduleId);
                module.setQuestions(questions);
                return module;
            }
        } catch (NumberFormatException e) {
            // Invalid ID format
        }
        return null;
    }

    // CREATE / UPDATE
    public void saveModule(LearningModule module) {
        if (module.getModuleId() == 0) {
            // New Module
            module.setCreatedAt(LocalDateTime.now());
            module.setUpdatedAt(LocalDateTime.now());
            moduleDao.save(module);
        } else {
            // Update Existing
            module.setUpdatedAt(LocalDateTime.now());
            moduleDao.update(module);
        }
    }

    // DELETE
    public void deleteModule(String id) {
        try {
            int moduleId = Integer.parseInt(id);
            moduleQuestionDao.deleteByModuleId(moduleId);
            moduleDao.deleteById(moduleId);
        } catch (NumberFormatException e) {
            // Invalid ID format
        }
    }

    // QUESTION MANAGEMENT
    public ModuleQuestion getQuestionById(int questionId) {
        return moduleQuestionDao.findById(questionId).orElse(null);
    }

    public void saveQuestion(ModuleQuestion question) {
        if (question.getQuestionId() == 0) {
            // New Question
            question.setCreatedAt(LocalDateTime.now());
            question.setUpdatedAt(LocalDateTime.now());
            moduleQuestionDao.save(question);
        } else {
            // Update Existing
            question.setUpdatedAt(LocalDateTime.now());
            moduleQuestionDao.update(question);
        }
    }

    public void deleteQuestion(int questionId) {
        moduleQuestionDao.deleteById(questionId);
    }
}