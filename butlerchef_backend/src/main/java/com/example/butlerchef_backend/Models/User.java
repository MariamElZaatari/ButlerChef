package com.example.butlerchef_backend.Models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table
@DynamicUpdate
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email(message = "Invalid Email")
    @NotEmpty(message = "Password is mandatory.")
    private String email;

    @Pattern(regexp="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$",message = "Invalid Password")
    @NotEmpty(message = "Password is mandatory.")
    private String password;

    @Pattern(regexp="^[A-Za-z]*$",message = "Invalid First Name")
    @NotEmpty(message = "Invalid First Name")
    private String firstName;

    @Pattern(regexp="^[A-Za-z]*$",message = "Invalid Last Name")
    @NotEmpty(message = "Invalid Last Name")
    private String lastName;

    private String image;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "role_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"created_at","updated_at"})
    private UserRole userRole;

    private String created_at;
    private String updated_at;
//
//    @OneToMany( cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "user_id")
//    private Collection<Address> addresses;

//    @OneToMany(mappedBy = "user")
//    private Collection<Recipe> recipes;
//
//    @ManyToMany(cascade = { CascadeType.ALL })
//    @JoinTable(
//            name = "cooked_recipe",
//            joinColumns = { @JoinColumn(name = "user_id") },
//            inverseJoinColumns = { @JoinColumn(name = "recipe_id") }
//    )
//    Set<CookedRecipe> cookedRecipes = new HashSet<>();

//    @ManyToMany(cascade = { CascadeType.ALL })
//    @JoinTable(
//            name = "favorite_recipe",
//            joinColumns = { @JoinColumn(name = "user_id") },
//            inverseJoinColumns = { @JoinColumn(name = "recipe_id") }
//    )
//    Set<CookedRecipe> favoriteRecipes = new HashSet<>();
//
//    public Set<CookedRecipe> getFavoriteRecipes() {
//        return favoriteRecipes;
//    }
//
//    public void setFavoriteRecipes(Set<CookedRecipe> favoriteRecipes) {
//        this.favoriteRecipes = favoriteRecipes;
//    }
//
//    public Set<CookedRecipe> getCookedRecipes() {
//        return cookedRecipes;
//    }
//
//    public void setCookedRecipes(Set<CookedRecipe> cookedRecipes) {
//        this.cookedRecipes = cookedRecipes;
//    }
//
//    public Collection<Recipe> getRecipes() {
//        return recipes;
//    }
//
//    public void setRecipes(Collection<Recipe> recipes) {
//        this.recipes = recipes;
//    }



    public User() {
        this.setCreated_at();
        this.setUpdated_at();
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(Long id, String email, String password, String firstName, String lastName, String image) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.image = image;
        this.setCreated_at();
        this.setUpdated_at();

    }

    public User(String email, String password, String firstName, String lastName, String image) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.image = image;
        this.setCreated_at();
        this.setUpdated_at();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

//    public Collection<Address> getAddresses() {
//        return addresses;
//    }
//
//    public void setAddresses(Collection<Address> addresses) {
//        this.addresses = addresses;
//    }
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

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", first_name='" + firstName + '\'' +
                ", last_name='" + lastName + '\'' +
                ", image='" + image + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }

}