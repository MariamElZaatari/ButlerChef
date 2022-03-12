package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

@Entity
@Table
public class UserRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Role Cannot be Empty")
    private String role;
    private String created_at;
    private String updated_at;

    public UserRole() {
        this.setCreated_at();
        this.setUpdated_at();
    }


    public UserRole(String role) {
        this.role = role;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public UserRole(Long id, String role) {
        this.id = id;
        this.role = role;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
        Date now = new Date();
        this.created_at = sdf.format(now);
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
        Date now = new Date();
        this.updated_at = sdf.format(now);
    }

}
