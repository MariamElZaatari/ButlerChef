package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.FavoriteRecipe;
import com.example.butlerchef_backend.Services.CookedRecipeService;
import com.example.butlerchef_backend.Services.FavoriteRecipeService;
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
@RequestMapping("/api/favorite")
public class FavoriteRecipeController {
    private final FavoriteRecipeService favoriteRecipeService;

    @Autowired
    public FavoriteRecipeController(FavoriteRecipeService favoriteRecipeService) {
        this.favoriteRecipeService = favoriteRecipeService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createFavoriteRecipe(@Valid @RequestBody Map<String, Long> map){

        FavoriteRecipe favoriteRecipe=favoriteRecipeService.create(map.get("userId"),map.get("recipeId"));

//        int userId, int recipeId
//        return map.get("userId") + ", " + map.get("recipeId");
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Favorite recipe created successfully");
        responseMap.put("data", favoriteRecipe);

        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/read/{id}")
    public Collection<FavoriteRecipe> readUserFavoriteRecipes(@PathVariable Long id){
        return favoriteRecipeService.read(id);
    }

    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteFavoriteRecipe(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Favorite recipe deleted successfully");
        favoriteRecipeService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/search/{id}/{name}")
    public Collection<FavoriteRecipe> searchFavoriteRecipeByUserIdAndName(@PathVariable Long id, @PathVariable String name){
        return favoriteRecipeService.getByUserIdAndRecipeName(id, name);
    }
}
