package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.RecipeProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface RecipeProductRepository extends JpaRepository<RecipeProduct, Long> {
    Collection<RecipeProduct> findByRecipeId(Long id);
}
