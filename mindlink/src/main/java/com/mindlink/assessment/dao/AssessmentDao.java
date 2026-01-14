package com.mindlink.assessment.dao;
import com.mindlink.assessment.Assessment;
import java.util.List;

public interface AssessmentDao {
    List<String> findAllAssessmentTitles();
    List<Assessment> findByTitlePaged(String title, int offset, int limit);
    int countByTitle(String title);
    List<Assessment> findByTitle(String title);
    List<Assessment> findAll();
    Assessment findById(int id);
    void save(Assessment assessment);
    void update(Assessment assessment);
    void delete(int id);
}