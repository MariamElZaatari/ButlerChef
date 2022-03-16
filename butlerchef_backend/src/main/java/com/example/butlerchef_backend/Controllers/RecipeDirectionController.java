package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.RecipeDirection;
import com.example.butlerchef_backend.Models.RecipeProduct;
import com.example.butlerchef_backend.Services.AddressService;
import com.example.butlerchef_backend.Services.RecipeDirectionService;
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
@RequestMapping("/api/recipeDirection")
public class RecipeDirectionController {
    private final RecipeDirectionService recipeDirectionService;

    @Autowired
    public RecipeDirectionController(RecipeDirectionService recipeDirectionService) {
        this.recipeDirectionService = recipeDirectionService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createRecipeDirection(@Valid @RequestBody RecipeDirection recipeDirection){
        RecipeDirection new_recipeDirection=recipeDirectionService.create(recipeDirection);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Recipe Direction created successfully");
        responseMap.put("data", new_recipeDirection);
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getRecipeDirection(@PathVariable Long id){
        Collection<RecipeDirection> recipeDirectionCollection = recipeDirectionService.read(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", recipeDirectionCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateRecipeDirection(@Valid @RequestBody RecipeDirection recipeDirection){
        RecipeDirection new_recipeDirection = recipeDirectionService.update(recipeDirection);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("Recipe Direction updated successfully", new_recipeDirection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteRecipeDirection(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Recipe Direction deleted successfully");
        recipeDirectionService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}
