package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(indexes = @Index(name ="idx_fridge_product_user_id", columnList = "user_id"))
public class FridgeProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"email","firstName","lastName","imageUrl","password","userRole","email","password","created_at","updated_at"})
    private User user;

    @ManyToOne( cascade = CascadeType.MERGE)
    @JoinColumn(name = "quantity_id")
    @JsonIgnoreProperties({"created_at","updated_at"})
    private Quantity quantity;

    @ManyToOne( cascade = CascadeType.MERGE)
    @JoinColumn(name = "measurement_id")
    @JsonIgnoreProperties({"quantities","created_at","updated_at"})
    private Measurement measurement;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Name")
    @NotEmpty(message = "Name is mandatory.")
    private String name;

    private String createdAt;
    private String updatedAt;

    public FridgeProduct() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public FridgeProduct(User user, Quantity quantity, Measurement measurement, String name, String createdAt, String updatedAt) {
        this.user = user;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public FridgeProduct(Long id, User user, Quantity quantity, Measurement measurement, String name, String createdAt, String updatedAt) {
        this.id = id;
        this.user = user;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
