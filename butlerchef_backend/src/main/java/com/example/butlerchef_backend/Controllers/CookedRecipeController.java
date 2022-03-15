package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Services.CookedRecipeService;
import com.example.butlerchef_backend.Services.RecipeService;
import org.apache.juli.logging.Log;
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
@RequestMapping("/api/cooked")
public class CookedRecipeController {
    private final CookedRecipeService cookedRecipeService;

    @Autowired
    public CookedRecipeController(CookedRecipeService cookedRecipeService) {
        this.cookedRecipeService = cookedRecipeService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createCookedRecipe(@Valid @RequestBody Map<String, Long> map){

        CookedRecipe cookedRecipe=cookedRecipeService.create(map.get("userId"),map.get("recipeId"));

//        int userId, int recipeId
//        return map.get("userId") + ", " + map.get("recipeId");
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","cooked recipe created successfully");
        responseMap.put("data", cookedRecipe);

        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/read/{id}")
    public Collection<CookedRecipe> readUserCookedRecipes(@PathVariable Long id){
        return cookedRecipeService.read(id);
    }

    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteCookedRecipe(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","cooked recipe deleted successfully");
        cookedRecipeService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/search/{id}/{name}")
    public Collection<CookedRecipe> searchCookedRecipeByUserIdAndName(@PathVariable Long id, @PathVariable String name){
        return cookedRecipeService.getByUserIdAndRecipeName(id, name);
    }
//    @GetMapping("/search/{name}")
//    public Collection<Recipe> readByName(@PathVariable String name){
//        return recipeService.getRecipesByName(name);
//    }

}
