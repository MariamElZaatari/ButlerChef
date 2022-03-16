package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table
public class RecipeProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "recipe_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"user","name","rate","level","imageUrl","time","serving","visibility","createdAt","updatedAt"})
    private Recipe recipe;

    @ManyToOne( cascade = CascadeType.MERGE)
    @JoinColumn(name = "quantity_id")
    @JsonIgnoreProperties({"created_at","updated_at"})
    private Quantity quantity;

    @ManyToOne( cascade = CascadeType.MERGE)
    @JoinColumn(name = "measurement_id")
    @JsonIgnoreProperties({"quantities","created_at","updated_at"})
    private Measurement measurement;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Title")
    @NotEmpty(message = "Name is mandatory.")
    private String name;

    private String createdAt;
    private String updatedAt;

    public RecipeProduct() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public RecipeProduct(Long id, Quantity quantity, Measurement measurement, String name, String createdAt, String updatedAt) {
        this.id = id;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public RecipeProduct(Quantity quantity, Measurement measurement, String name, String createdAt, String updatedAt) {
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public Quantity getQuantity() {
        return quantity;
    }

    public void setQuantity(Quantity quantity) {
        this.quantity = quantity;
    }

    public Measurement getMeasurement() {
        return measurement;
    }

    public void setMeasurement(Measurement measurement) {
        this.measurement = measurement;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
