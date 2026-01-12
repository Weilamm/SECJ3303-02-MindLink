package com.mindlink.repository;

import com.mindlink.model.Admin;
import java.util.List;
import java.util.Optional;

public interface AdminDao {
    List<Admin> findAll();

    Optional<Admin> findById(String id);

    void save(Admin admin);

    void update(Admin admin);

    void deleteById(String id);
}
