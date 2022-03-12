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
    private Recipe recipe;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Title")
    @NotEmpty(message = "Title is mandatory.")
    private String title;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Content")
    @NotEmpty(message = "Content is mandatory.")
    private String content;

    private String created_at;
    private String updated_at;

    public RecipeDirection() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public RecipeDirection(Recipe recipe, String title, String content, String created_at, String updated_at) {
        this.recipe = recipe;
        this.title = title;
        this.content = content;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public RecipeDirection(Long id, Recipe recipe, String title, String content, String created_at, String updated_at) {
        this.id = id;
        this.recipe = recipe;
        this.title = title;
        this.content = content;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getRecipe() {
        return recipe.getId();
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
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
