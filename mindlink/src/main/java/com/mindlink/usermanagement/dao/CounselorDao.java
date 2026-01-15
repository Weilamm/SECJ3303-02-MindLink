package com.mindlink.usermanagement.dao;

import com.mindlink.usermanagement.model.Counselor;
import java.util.List;
import java.util.Optional;

public interface CounselorDao {
    List<Counselor> findAll();

    Optional<Counselor> findById(String id);

    void save(Counselor counselor);

    void update(Counselor counselor);

    void deleteById(String id);
    List<Counselor> findByNameOrLocation(String keyword);
    List<Counselor> findByStatus(String status);
    void updateStatus(String id, String status);
    List<Counselor> searchByIdOrName(String keyword);
}
