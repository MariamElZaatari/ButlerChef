package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table
public class Measurement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "Unit cannot be Empty or Null")
    private String unit;
    private String created_at;
    private String updated_at;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
            name = "quantity_measurement",
            joinColumns = { @JoinColumn(name = "measurement_id") },
            inverseJoinColumns = { @JoinColumn(name = "quantity_id") }
    )
    @JsonIgnoreProperties({"created_at","updated_at"})
    Set<Quantity> quantities = new HashSet<>();

    public Set<Quantity> getQuantities() {
        return quantities;
    }

    public void setQuantities(Set<Quantity> quantities) {
        this.quantities = quantities;
    }

    public Measurement(){
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getValue() {
        return unit;
    }

    public void setValue(String unit) {
        this.unit = unit;
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
