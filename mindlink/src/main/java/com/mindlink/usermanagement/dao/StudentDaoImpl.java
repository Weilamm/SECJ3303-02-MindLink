package com.mindlink.usermanagement.dao;

import com.mindlink.usermanagement.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Repository
public class StudentDaoImpl implements StudentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Student> rowMapper = new RowMapper<Student>() {
        @Override
        public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
            Student student = new Student();
            student.setStudentId(rs.getString("student_id"));
            student.setName(rs.getString("name"));
            student.setEmail(rs.getString("email"));
            student.setPassword(rs.getString("password"));
            student.setPhone(rs.getString("phone"));
            student.setFaculty(rs.getString("faculty"));
            student.setYear(rs.getObject("year") != null ? rs.getInt("year") : null);

            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null)
                student.setCreatedAt(createdAt.toLocalDateTime());

            Timestamp updatedAt = rs.getTimestamp("updated_at");
            if (updatedAt != null)
                student.setUpdatedAt(updatedAt.toLocalDateTime());

            return student;
        }
    };

    @Override
    public List<Student> findAll() {
        String sql = "SELECT * FROM student";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public Optional<Student> findById(String id) {
        String sql = "SELECT * FROM student WHERE student_id = ?";
        List<Student> students = jdbcTemplate.query(sql, rowMapper, id);
        return students.stream().findFirst();
    }

    @Override
    public void save(Student student) {
        String sql = "INSERT INTO student (student_id, name, email, password, phone, faculty, year, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                student.getStudentId(),
                student.getName(),
                student.getEmail(),
                student.getPassword(),
                student.getPhone(),
                student.getFaculty(),
                student.getYear(),
                student.getCreatedAt(),
                student.getUpdatedAt());
    }

    @Override
    public void update(Student student) {
        String sql = "UPDATE student SET name=?, email=?, password=?, phone=?, faculty=?, year=?, updated_at=? WHERE student_id=?";
        jdbcTemplate.update(sql,
                student.getName(),
                student.getEmail(),
                student.getPassword(),
                student.getPhone(),
                student.getFaculty(),
                student.getYear(),
                student.getUpdatedAt(),
                student.getStudentId());
    }

    @Override
    public void deleteById(String id) {
        String sql = "DELETE FROM student WHERE student_id = ?";
        jdbcTemplate.update(sql, id);
    }
}