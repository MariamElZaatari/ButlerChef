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

    @OneToOne( cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "quantity_id")
    private Quantity quantity;

    @OneToOne( cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "measurement_id")
    @JsonIgnoreProperties("quantities")
    private Measurement measurement;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Name")
    @NotEmpty(message = "Name is mandatory.")
    private String name;

    @Digits(integer = 10, fraction =2, message = "Invalid Price")
    @PositiveOrZero(message = "Negative value not allowed.")
    @NotNull(message = "Price is mandatory.")
    private int price;

    @NotEmpty(message = "Image is mandatory.")
    private String image;

    @Digits(integer = 10, fraction =2, message = "Invalid Stock")
    @PositiveOrZero(message = "Negative value not allowed.")
    @NotNull(message = "Stock is mandatory.")
    private int stock;

    private String created_at;
    private String updated_at;

    public ShopProduct() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public ShopProduct(Quantity quantity, Measurement measurement, String name, int price, String image, int stock, String created_at, String updated_at) {
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public ShopProduct(Long id, Quantity quantity, Measurement measurement, String name, int price, String image, int stock, String created_at, String updated_at) {
        this.id = id;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.setCreated_at();
        this.setUpdated_at();
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
