package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"email","firstName","lastName","imageUrl","password","userRole","email","password","created_at","updated_at"})
    private User user;

    @NotEmpty(message = "Title is mandatory.")
    private String title;

    @NotEmpty(message = "Street is mandatory.")
    private String street;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Name")
    @NotEmpty(message = "City is mandatory.")
    private String city;

    @Pattern(regexp="^[0-9]*$",message = "Invalid Name")
    @NotEmpty(message = "Phone is mandatory.")
    @Size(min = 8, max = 8)
    private String phone;

    private String createdAt;
    private String updatedAt;

    public Address() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
