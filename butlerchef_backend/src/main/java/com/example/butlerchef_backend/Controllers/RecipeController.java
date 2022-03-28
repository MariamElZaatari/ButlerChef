package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.CookedRecipeDisplayInfo;
import com.example.butlerchef_backend.Repositories.FavoriteRecipeDisplayInfo;
import com.example.butlerchef_backend.Repositories.RecipeDisplayInfo;
import com.example.butlerchef_backend.Services.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@RestController
@Validated
@RequestMapping("/api/recipe")
public class RecipeController {

    private final RecipeService recipeService;

    @Autowired
    public RecipeController(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

    @PostMapping("/create")
    public Recipe create(@Valid @RequestBody Recipe recipe){
        return recipeService.createRecipe(recipe);
    }

    @GetMapping("/{id}")
    public Collection<Recipe> readUserRecipes(@PathVariable Long id){
        return recipeService.getRecipesByUserId(id);
    }

    @GetMapping("/search/{name}")
    public Collection<Recipe> readByName(@PathVariable String name){
        return recipeService.getRecipesByName(name);
    }

    @GetMapping("/search/{id}/{name}")
    public Collection<Recipe> readByUserAndRecipeName(@PathVariable Long id, @PathVariable String name){
        return recipeService.getRecipesByUserIdAndRecipeName(id, name);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateRecipe(@Valid @RequestBody Recipe recipe){
        Recipe r = recipeService.update(recipe);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("recipe updated successfully", r);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteRecipe(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Recipe deleted successfully");
        recipeService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    @GetMapping("display/{id}")
    public Collection<RecipeDisplayInfo> readRecipesByLoggedUser(@PathVariable Long id){
        return recipeService.getRecipesDisplayInfoForLoggedUser(id);
    }

    @GetMapping("display/favorite/{id}")
    public Collection<FavoriteRecipeDisplayInfo> readFavoriteRecipesByLoggedUser(@PathVariable Long id){
        return recipeService.getFavoriteRecipesDisplayInfoForLoggedUser(id);
    }

    @GetMapping("display/cooked/{id}")
    public Collection<CookedRecipeDisplayInfo> readCookedRecipesByLoggedUser(@PathVariable Long id){
        return recipeService.getCookedRecipesDisplayInfoForLoggedUser(id);
    }

    @GetMapping("display/profile/{id}")
    public Collection<RecipeDisplayInfo> readProfileRecipesForLoggedUser(@PathVariable Long id){
        return recipeService.getProfileRecipesDisplayInfoForLoggedUser(id);
    }
}
