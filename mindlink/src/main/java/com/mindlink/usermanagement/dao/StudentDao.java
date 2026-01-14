package com.mindlink.usermanagement.dao;

import com.mindlink.usermanagement.model.Student;
import java.util.List;
import java.util.Optional;

public interface StudentDao {
    List<Student> findAll();

    Optional<Student> findById(String id);

    void save(Student student);

    void update(Student student);

    void deleteById(String id);
    
    List<Student> searchByIdOrName(String keyword);
}