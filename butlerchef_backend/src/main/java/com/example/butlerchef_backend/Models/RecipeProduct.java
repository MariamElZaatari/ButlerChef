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

    @OneToOne( cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "quantity_id")
    private Quantity quantity;

    @OneToOne( cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "measurement_id")
    @JsonIgnoreProperties("quantities")
    private Measurement measurement;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Title")
    @NotEmpty(message = "Name is mandatory.")
    private String name;

    private String created_at;
    private String updated_at;

    public RecipeProduct() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public RecipeProduct(Long id, Quantity quantity, Measurement measurement, String name, String created_at, String updated_at) {
        this.id = id;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public RecipeProduct(Quantity quantity, Measurement measurement, String name, String created_at, String updated_at) {
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
