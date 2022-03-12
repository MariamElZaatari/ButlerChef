package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Entity
@Table
public class Recipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties("recipes")
    private User user;

    private String name;
    private int rate;
    private String level;
    private String time;
    private String serving;
    private String image;
    private int visibility;
    private String created_at;
    private String updated_at;

    public Recipe() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Recipe(Long id, User user, String name, int rate, String level, String time, String serving, String image, int visibility) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.rate = rate;
        this.level = level;
        this.time = time;
        this.serving = serving;
        this.image = image;
        this.visibility = visibility;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Recipe(User user, String name, int rate, String level, String time, String serving, String image, int visibility) {
        this.user = user;
        this.name = name;
        this.rate = rate;
        this.level = level;
        this.time = time;
        this.serving = serving;
        this.image = image;
        this.visibility = visibility;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getServing() {
        return serving;
    }

    public void setServing(String serving) {
        this.serving = serving;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getVisibility() {
        return visibility;
    }

    public void setVisibility(int visibility) {
        this.visibility = visibility;
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
