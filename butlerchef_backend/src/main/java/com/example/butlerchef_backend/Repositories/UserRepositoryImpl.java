package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Objects;

@Repository
public class UserRepositoryImpl implements UserRepository{

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public Integer create(User user) {

        System.out.print(user.toString());

        String SQL_CREATE = "INSERT INTO USERS(id, email, password, first_name, last_name, role_id, image, created_at, updated_at) VALUES(NULL , ?, ?, ?, ?, ?, ?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(SQL_CREATE, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFirst_name());
            ps.setString(4, user.getLast_name());
            ps.setInt(5, user.getRole_id());
            ps.setString(6, user.getImage());
            ps.setDate(7, Date.valueOf("2022-03-10"));
            ps.setDate(8, Date.valueOf("2022-03-10"));
            return ps;
        }, keyHolder);

        return (Integer) Objects.requireNonNull(keyHolder.getKeys()).get("id");
    }

}
