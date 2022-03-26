package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table
public class ShopProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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

    @Digits(integer = 10, fraction =2, message = "Invalid Price")
    @PositiveOrZero(message = "Negative value not allowed.")
    @NotNull(message = "Price is mandatory.")
    private double price;

    @NotEmpty(message = "Image is mandatory.")
    private String imageUrl;

    @Digits(integer = 10, fraction =2, message = "Invalid Stock")
    @PositiveOrZero(message = "Negative value not allowed.")
    @NotNull(message = "Stock is mandatory.")
    private int stock;

    private String createdAt;
    private String updatedAt;

    public ShopProduct() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public ShopProduct(Quantity quantity, Measurement measurement, String name, int price, String imageUrl, int stock, String createdAt, String updatedAt) {
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.stock = stock;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public ShopProduct(Long id, Quantity quantity, Measurement measurement, String name, int price, String imageUrl, int stock, String createdAt, String updatedAt) {
        this.id = id;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
        this.stock = stock;
        this.setCreatedAt();
        this.setUpdatedAt();
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
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
