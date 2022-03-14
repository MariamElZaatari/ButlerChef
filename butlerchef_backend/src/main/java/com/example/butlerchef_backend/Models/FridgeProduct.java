package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table
public class FridgeProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

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


    private String created_at;
    private String updated_at;

    public FridgeProduct() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public FridgeProduct(User user, Quantity quantity, Measurement measurement, String name, String created_at, String updated_at) {
        this.user = user;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public FridgeProduct(Long id, User user, Quantity quantity, Measurement measurement, String name, String created_at, String updated_at) {
        this.id = id;
        this.user = user;
        this.quantity = quantity;
        this.measurement = measurement;
        this.name = name;
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
