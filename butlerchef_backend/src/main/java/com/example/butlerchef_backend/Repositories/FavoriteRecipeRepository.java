package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.FavoriteRecipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface FavoriteRecipeRepository extends JpaRepository<FavoriteRecipe, Long>{
    Collection<FavoriteRecipe> findByUserIdOrderByCreatedAtDesc(Long id);
    Collection<FavoriteRecipe> findByUserIdAndRecipeNameLikeIgnoreCaseOrderByRecipeNameAsc(Long id, String name);
    @Modifying
    @Query("DELETE FROM FavoriteRecipe f WHERE f.user.id =:userId and f.recipe.id =:recipeId")
    void deleteByRecipeIdAndUserId(@Param("userId") Long userId, @Param("recipeId")  Long recipeId);
}
