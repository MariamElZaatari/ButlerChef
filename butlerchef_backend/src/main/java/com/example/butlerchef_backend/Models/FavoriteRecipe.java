package com.example.butlerchef_backend.Models;


import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@DiscriminatorValue("2")
public class FavoriteRecipe extends Recipe{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    private String created_at;
    private String updated_at;

    public FavoriteRecipe() {

    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public FavoriteRecipe(Long id, User user, String name, double rate, String level, String time, String serving, String image, int visibility, Long id1, String created_at, String updated_at) {
        super(id, user, name, rate, level, time, serving, image, visibility);
        this.id = id1;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public FavoriteRecipe(User user, String name, double rate, String level, String time, String serving, String image, int visibility, Long id, String created_at, String updated_at) {
        super(user, name, rate, level, time, serving, image, visibility);
        this.id = id;
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
