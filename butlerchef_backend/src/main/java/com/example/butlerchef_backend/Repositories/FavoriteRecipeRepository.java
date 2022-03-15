package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.FavoriteRecipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface FavoriteRecipeRepository extends JpaRepository<FavoriteRecipe, Long>{
    Collection<FavoriteRecipe> findByUserIdOrderByCreatedAtDesc(Long id);
    Collection<FavoriteRecipe> findByUserIdAndRecipeNameLikeIgnoreCaseOrderByRecipeNameAsc(Long id, String name);
}
