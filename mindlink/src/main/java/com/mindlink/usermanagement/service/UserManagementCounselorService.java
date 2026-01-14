package com.mindlink.usermanagement.service;

import com.mindlink.usermanagement.dao.CounselorDao;
import com.mindlink.usermanagement.model.Counselor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserManagementCounselorService {

    @Autowired
    private CounselorDao counselorDao;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Counselor> getAllCounselors() {
        return counselorDao.findAll();
    }

    public Optional<Counselor> getCounselorById(String id) {
        return counselorDao.findById(id);
    }

    public void saveCounselor(Counselor counselor) {
        if (counselor.getCounselorId() != null && !counselor.getCounselorId().isEmpty()) {
            Counselor existing = counselorDao.findById(counselor.getCounselorId()).orElse(null);
            if (existing != null) {
                // Update
                if (counselor.getPassword() == null || counselor.getPassword().isEmpty()) {
                    counselor.setPassword(existing.getPassword());
                }
                counselorDao.update(counselor);
            } else {
                createCounselor(counselor);
            }
        } else {
            createCounselor(counselor);
        }
    }

    private void createCounselor(Counselor counselor) {
        String newId = generateNextCounselorId();
        counselor.setCounselorId(newId);
        counselorDao.save(counselor);
    }

    private String generateNextCounselorId() {
        String sql = "SELECT MAX(CAST(SUBSTRING(counselor_id, 2) AS UNSIGNED)) FROM counselor WHERE counselor_id REGEXP '^C[0-9]+$'";
        try {
            Integer maxNum = jdbcTemplate.queryForObject(sql, Integer.class);
            if (maxNum == null) {
                maxNum = 0;
            }
            int nextNum = maxNum + 1;
            return String.format("C%03d", nextNum);
        } catch (Exception e) {
            return "C001";
        }
    }

    public void deleteCounselor(String id) {
        counselorDao.deleteById(id);
    }

    public List<Counselor> searchCounselors(String keyword) {
        if (keyword == null || keyword.isEmpty()) {
            return getAllCounselors();
        }
        return counselorDao.findByNameOrLocation(keyword);
    }
}
