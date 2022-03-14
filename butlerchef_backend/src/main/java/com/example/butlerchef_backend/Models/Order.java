package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "address_id", referencedColumnName = "id")
    private Address address;

    @Digits(integer = 10, fraction =2)
    @PositiveOrZero
    @NotNull(message = "Total is mandatory.")
    private int total;

    @Pattern(regexp="^[a-zA-Z\\s]*$",message = "Invalid Status")
    @NotEmpty(message = "Status is mandatory.")
    private String status;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
            name = "order_product",
            joinColumns = { @JoinColumn(name = "order_id") },
            inverseJoinColumns = { @JoinColumn(name = "product_id") }
    )
    @JsonIgnoreProperties({"created_at","updated_at"})
    Set<Quantity> products = new HashSet<>();

    private String created_at;
    private String updated_at;

    public Order() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Order(User user, Address address, int total, String status, String created_at, String updated_at) {
        this.user = user;
        this.address = address;
        this.total = total;
        this.status = status;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Order(Long id, User user, Address address, int total, String status, String created_at, String updated_at) {
        this.id = id;
        this.user = user;
        this.address = address;
        this.total = total;
        this.status = status;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Set<Quantity> getProducts() {       return products;
    }

    public void setProducts(Set<Quantity> products) {
        this.products = products;
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
