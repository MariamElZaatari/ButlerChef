package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Services.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

@RestController
@RequestMapping("/api/recipe")
public class RecipeController {

    private final RecipeService recipeService;

    @Autowired
    public RecipeController(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

    @PostMapping("/create")
    public Recipe create(@RequestBody Recipe recipe){
        return recipeService.createRecipe(recipe);
    }

    @GetMapping("/q={name}")
    public Collection<Recipe> readByName(@PathVariable String name){
        return recipeService.getRecipesByName(name);
    }

    @GetMapping("/{id}")
    public Collection<Recipe> readUserRecipes(@PathVariable Long id){
        return recipeService.getRecipesByUserId(id);
    }

}