package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table
public class UserOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"email","firstName","lastName","imageUrl","password","userRole","email","password","created_at","updated_at"})
    private User user;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "address_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"user","createdAt","updatedAt"})
    private Address address;

    @Digits(integer = 10, fraction =2)
    @PositiveOrZero
    @NotNull(message = "Total is mandatory.")
    private int total;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Status")
    @NotEmpty(message = "Status is mandatory.")
    private String status;

    private String createdAt;
    private String updatedAt;

    public UserOrder() {
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public UserOrder(User user, Address address, int total, String status, String createdAt, String updatedAt) {
        this.user = user;
        this.address = address;
        this.total = total;
        this.status = status;
        this.setCreatedAt();
        this.setUpdatedAt();
    }

    public UserOrder(Long id, User user, Address address, int total, String status, String createdAt, String updatedAt) {
        this.id = id;
        this.user = user;
        this.address = address;
        this.total = total;
        this.status = status;
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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
