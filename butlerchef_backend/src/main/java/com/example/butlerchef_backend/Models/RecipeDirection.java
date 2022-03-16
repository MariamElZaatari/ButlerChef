package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table
public class RecipeDirection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "recipe_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"user","name","rate","level","imageUrl","time","serving","visibility","createdAt","updatedAt"})
    private Recipe recipe;

    @Pattern(regexp="^[a-zA-Z0-9\\s]+$",message = "Invalid Title")
    @NotEmpty(message = "Title is mandatory.")
    private String title;

    @Pattern(regexp="^[a-zA-Z0-9\\s]+$",message = "Invalid Content")
    @NotEmpty(message = "Content is mandatory.")
    private String content;

    private String createdAt;
    private String updatedAt;

    public RecipeDirection() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public RecipeDirection(String title, String content, String createdAt, String updatedAt) {
        this.title = title;
        this.content = content;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public RecipeDirection(Long id, String title, String content, String createdAt, String updatedAt) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
