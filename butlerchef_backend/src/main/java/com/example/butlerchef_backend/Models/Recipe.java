package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Collection;
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
    @JsonIgnoreProperties({"userRole","email","password","created_at","updated_at", "recipes", "addresses"})
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
    private String image;

    private int visibility;

    private String created_at;
    private String updated_at;

    @OneToMany( cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "recipe_id")
    private Collection<RecipeDirection> recipeDirections;

    public Collection<RecipeDirection> getRecipeDirections() {
        return recipeDirections;
    }

    public void setRecipeDirections(Collection<RecipeDirection> recipeDirections) {
        this.recipeDirections = recipeDirections;
    }

    public Recipe() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Recipe(Long id, User user, String name, double rate, String level, String time, String serving, String image, int visibility) {
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

    public Recipe(User user, String name, double rate, String level, String time, String serving, String image, int visibility) {
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
