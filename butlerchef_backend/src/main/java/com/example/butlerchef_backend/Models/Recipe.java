package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

@Entity
public class Recipe {

//    @Column(name="recipe_type_id", insertable = false, updatable = false)
//    protected int recipeTypeId;
//
//    public void setRecipeTypeId(String recipeTypeId) {
//        this.recipeTypeId = Integer.parseInt(recipeTypeId);
//    }
//
//    public int getRecipeTypeId() {
//        return recipeTypeId;
//    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"userRole","email","password","created_at","updated_at"})
    private User user;


    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Name")
    @NotEmpty(message = "Name is mandatory.")
    private String name;

    @Digits(integer = 1,fraction = 1, message = "Invalid Rate")
    @Min(0)
    @Max(5)
    @NotNull(message = "Rate is mandatory.")
    private double rate;

    @Pattern(regexp="^[A-Za-z]*$",message = "Invalid Level")
    @NotEmpty(message = "Level is mandatory.")
    private String level;

    @NotEmpty(message = "Time is mandatory.")
    private String time;

    @NotEmpty(message = "Serving is mandatory.")
    private String serving;

    @NotEmpty(message = "Image is mandatory.")
    private String imageUrl;

    private int visibility;

    private String createdAt;
    private String updatedAt;

//    @OneToMany( cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "recipe_id")
//    private Collection<RecipeDirection> recipeDirections;
//
//    @OneToMany( cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "recipe_id")
//    private Collection<RecipeProduct> recipeProducts;

//    public Collection<RecipeProduct> getRecipeProducts() {
//        return recipeProducts;
//    }
//
//    public void setRecipeProducts(Collection<RecipeProduct> recipeProducts) {
//        this.recipeProducts = recipeProducts;
//    }
//
//    public Collection<RecipeDirection> getRecipeDirections() {
//        return recipeDirections;
//    }
//
//    public void setRecipeDirections(Collection<RecipeDirection> recipeDirections) {
//        this.recipeDirections = recipeDirections;
//    }

    public Recipe() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public Recipe(Long id, User user, String name, double rate, String level, String time, String serving, String imageUrl, int visibility) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.rate = rate;
        this.level = level;
        this.time = time;
        this.serving = serving;
        this.imageUrl = imageUrl;
        this.visibility = visibility;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public Recipe(User user, String name, double rate, String level, String time, String serving, String imageUrl, int visibility) {
        this.user = user;
        this.name = name;
        this.rate = rate;
        this.level = level;
        this.time = time;
        this.serving = serving;
        this.imageUrl = imageUrl;
        this.visibility = visibility;
        this.setCreatedAt();
        this.setUpdatedAt();
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

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getVisibility() {
        return visibility;
    }

    public void setVisibility(int visibility) {
        this.visibility = visibility;
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
