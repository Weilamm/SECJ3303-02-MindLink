package com.mindlink.module.dao;

import java.util.List;
import java.util.Optional;

import com.mindlink.module.ModuleQuestion;

public interface ModuleQuestionDao {
    List<ModuleQuestion> findByModuleId(int moduleId);
    Optional<ModuleQuestion> findById(int questionId);
    void save(ModuleQuestion question);
    void update(ModuleQuestion question);
    void deleteById(int questionId);
    void deleteByModuleId(int moduleId);
}

