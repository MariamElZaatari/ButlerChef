package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.*;
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
import java.util.List;
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

    @GetMapping("/{id}")
    public Collection<Recipe> readUserRecipes(@PathVariable Long id){
        return recipeService.getRecipesByUserId(id);
    }


    @GetMapping("/search/profile/{id}/{name}")
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

    @GetMapping("/search/{id}/{name}")
    public Collection<RecipeDisplayInfo> readByName(@PathVariable Long id, @PathVariable String name ){
        return recipeService.getRecipesByName(id, name);
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

    @PostMapping("/create")
    public boolean create(@Valid @RequestBody RecipeFullCard data){

        @Valid Recipe recipe = data.recipe;
        @Valid List<RecipeProduct> products = data.products;
        @Valid List<RecipeDirection> directions = data.directions;

        return recipeService.createFullRecipe(recipe, products, directions);
    }
}
