package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface CookedRecipeRepository extends JpaRepository<CookedRecipe, Long> {
    Collection<CookedRecipe> findByUserIdOrderByCreatedAtDesc(Long id);
    Collection<CookedRecipe> findByUserIdAndRecipeNameLikeIgnoreCaseOrderByRecipeNameAsc(Long id, String name);

}
