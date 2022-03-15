package com.example.butlerchef_backend.Models;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
public class FavoriteRecipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "recipe_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"created_at","updated_at"})
    private Recipe recipe;

    private String createdAt;
    private String updatedAt;

    public FavoriteRecipe() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }


//    @Override
//    public Long getId() {
//        return id;
//    }
//
//    @Override
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public FavoriteRecipe(Long id, User user, String name, double rate, String level, String time, String serving, String image, int visibility, Long id1, String created_at, String updated_at) {
//        super(id, user, name, rate, level, time, serving, image, visibility);
//        this.id = id1;
//        this.setCreated_at();
//        this.setUpdated_at();
//    }

//    public FavoriteRecipe(User user, String name, double rate, String level, String time, String serving, String image, int visibility, Long id, String created_at, String updated_at) {
//        super(user, name, rate, level, time, serving, image, visibility);
//        this.id = id;
//        this.setCreated_at();
//        this.setUpdated_at();
//    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getUser() {
        return user.getId();
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
        Date now = new Date();
        this.createdAt = sdf.format(now);
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
        Date now = new Date();
        this.updatedAt = sdf.format(now);
    }
}
