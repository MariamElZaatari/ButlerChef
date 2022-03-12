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
    private User user;


    @NotEmpty(message = "Street is mandatory.")
    private String street;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Name")
    @NotEmpty(message = "City is mandatory.")
    private String city;

    @Pattern(regexp="^[0-9]*$",message = "Invalid Name")
    @NotEmpty(message = "Phone is mandatory.")
    @Size(min = 8, max = 8)
    private String phone;

    private String created_at;
    private String updated_at;

    public Address() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Address(User user, String street, String city, String phone, String created_at, String updated_at) {
        this.user = user;
        this.street = street;
        this.city = city;
        this.phone = phone;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Address(Long id, User user, String street, String city, String phone, String created_at, String updated_at) {
        this.id = id;
        this.user = user;
        this.street = street;
        this.city = city;
        this.phone = phone;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser() {
        return user.getId();
    }

    public void setUser(User user) {
        this.user = user;
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
