package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long>{

    Collection<Recipe> findByNameLikeIgnoreCaseOrderByNameAsc(String name);
    Collection<Recipe> findByUserIdAndNameLikeIgnoreCaseOrderByNameAsc(Long id, String name);
    Collection<Recipe> findByUserIdOrderByCreatedAtDesc(Long id);

    @Query("SELECT r as recipe, (SELECT COUNT(*) FROM RecipeProduct rp WHERE rp.recipe.id=r.id) as total,(SELECT COUNT(*) FROM FridgeProduct fp WHERE fp.user.id=?1 AND fp.name IN (SELECT name FROM RecipeProduct rp WHERE rp.recipe.id=r.id)) as fridge, (SELECT COUNT(*) FROM FavoriteRecipe fr WHERE fr.user.id=?1 AND fr.recipe.id=r.id) as favorite, (SELECT COUNT(*) FROM CookedRecipe cr WHERE cr.user.id=?1 AND cr.recipe.id=r.id) as cooked FROM Recipe r GROUP BY r.id ORDER BY r.createdAt DESC")
    Collection<RecipeDisplayInfo> getRecipesInfoForLoggedUser(Long id);

    @Query("SELECT r as recipe, (SELECT COUNT(*) FROM RecipeProduct rp WHERE rp.recipe.id=r.id) as total,(SELECT COUNT(*) FROM FridgeProduct fp WHERE fp.user.id=id AND fp.name IN (SELECT name FROM RecipeProduct rp WHERE rp.recipe.id=r.id)) as fridge, (SELECT COUNT(*) FROM FavoriteRecipe fr WHERE fr.user.id=:id AND fr.recipe.id=r.id) as favorite, (SELECT COUNT(*) FROM CookedRecipe cr WHERE cr.user.id=id AND cr.recipe.id=r.id) as cooked FROM Recipe r WHERE r.name LIKE %:name% GROUP BY r.id ORDER BY r.name")
    Collection<RecipeDisplayInfo> getRecipesInfoByName(@Param("id") Long id, @Param("name") String name);

    @Query("SELECT r as recipe, (SELECT COUNT(*) FROM RecipeProduct rp WHERE rp.recipe.id=r.id) as total,(SELECT COUNT(*) FROM FridgeProduct fp WHERE fp.user.id=?1 AND fp.name IN (SELECT name FROM RecipeProduct rp WHERE rp.recipe.id=r.id)) as fridge,(SELECT COUNT(*) FROM CookedRecipe cr WHERE cr.user.id=?1 AND cr.recipe.id=r.id) as cooked FROM Recipe r GROUP BY r.id HAVING (SELECT COUNT(*) FROM FavoriteRecipe fr WHERE fr.user.id=?1 AND fr.recipe.id=r.id)=1 ORDER BY r.createdAt DESC")
    Collection<FavoriteRecipeDisplayInfo> getFavoriteRecipesInfoForLoggedUser(Long id);

    @Query("SELECT r as recipe, (SELECT COUNT(*) FROM RecipeProduct rp WHERE rp.recipe.id=r.id) as total,(SELECT COUNT(*) FROM FridgeProduct fp WHERE fp.user.id=?1 AND fp.name IN (SELECT name FROM RecipeProduct rp WHERE rp.recipe.id=r.id)) as fridge,(SELECT COUNT(*) FROM FavoriteRecipe fr WHERE fr.user.id=?1 AND fr.recipe.id=r.id) as favorite FROM Recipe r GROUP BY r.id HAVING (SELECT COUNT(*) FROM CookedRecipe cr WHERE cr.user.id=?1 AND cr.recipe.id=r.id)=1 ORDER BY r.createdAt DESC")
    Collection<CookedRecipeDisplayInfo> getCookedRecipesInfoForLoggedUser(Long id);

    @Query("SELECT r as recipe, (SELECT COUNT(*) FROM RecipeProduct rp WHERE rp.recipe.id=r.id) as total,(SELECT COUNT(*) FROM FridgeProduct fp WHERE fp.user.id=?1 AND fp.name IN (SELECT name FROM RecipeProduct rp WHERE rp.recipe.id=r.id)) as fridge, (SELECT COUNT(*) FROM FavoriteRecipe fr WHERE fr.user.id=?1 AND fr.recipe.id=r.id) as favorite, (SELECT COUNT(*) FROM CookedRecipe cr WHERE cr.user.id=?1 AND cr.recipe.id=r.id) as cooked FROM Recipe r WHERE r.user.id=?1 GROUP BY r.id ORDER BY r.createdAt DESC")
    Collection<RecipeDisplayInfo> getProfileRecipesInfoForLoggedUser(Long id);
}
