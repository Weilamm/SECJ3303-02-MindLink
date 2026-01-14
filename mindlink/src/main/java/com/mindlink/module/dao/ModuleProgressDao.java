package com.mindlink.module.dao;

import com.mindlink.module.UserProgress;
import java.util.List;

public interface ModuleProgressDao {
    void saveProgress(UserProgress progress);

    List<UserProgress> findByStudentAndModule(String studentId, int moduleId);

    List<UserProgress> findByStudent(String studentId);

    boolean isQuestionCompleted(String studentId, int questionId);
}
