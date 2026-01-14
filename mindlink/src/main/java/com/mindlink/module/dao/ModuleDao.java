package com.mindlink.module.dao;

import java.util.List;
import java.util.Optional;

import com.mindlink.module.LearningModule;

public interface ModuleDao {
    List<LearningModule> findAll();
    Optional<LearningModule> findById(int id);
    void save(LearningModule module);
    void update(LearningModule module);
    void deleteById(int id);
}



