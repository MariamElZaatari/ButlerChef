package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.RecipeDirection;
import com.example.butlerchef_backend.Models.RecipeProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface RecipeDirectionRepository extends JpaRepository<RecipeDirection, Long> {
    Collection<RecipeDirection> findByRecipeId(Long id);
}
