package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    Collection<Recipe> findByNameLikeIgnoreCase(String name);
    Collection<Recipe> findByUserId(Long id);
}
