package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;


@Entity
@Table
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String email;
    private String password;
    private String first_name;
    private String last_name;
    private String image;
    private int role_id;
    private String created_at;
    private String updated_at;

    @OneToMany(mappedBy = "user")
    private Collection<Recipe> recipes;

    public Collection<Recipe> getRecipes() {
        return recipes;
    }

    public void setRecipes(Collection<Recipe> recipes) {
        this.recipes = recipes;
    }

    public User() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(Long id, String email, String password, String first_name, String last_name, String image, int role_id) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.image = image;
        this.role_id = role_id;
        this.setCreated_at();
        this.setUpdated_at();

    }

    public User(String email, String password, String first_name, String last_name, String image, int role_id) {
        this.email = email;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.image = image;
        this.role_id = role_id;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
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

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", image='" + image + '\'' +
                ", role_id=" + role_id +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }

}