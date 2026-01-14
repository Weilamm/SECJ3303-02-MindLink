package com.mindlink.admin.dao;

import java.util.List;

import com.mindlink.admin.AdminAssessment;

public interface AdminAssessmentDao {
    List<AdminAssessment> findByModuleId(int moduleId);
    AdminAssessment findById(int id);
    void save(AdminAssessment assessment);
    void update(AdminAssessment assessment);
    void delete(int id);
}