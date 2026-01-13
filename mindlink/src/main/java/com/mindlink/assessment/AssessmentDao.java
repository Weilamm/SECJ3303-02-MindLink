package com.mindlink.assessment;

import java.util.List;

public interface AssessmentDao {
    List<Assessment> findByTitle(String title);
}
