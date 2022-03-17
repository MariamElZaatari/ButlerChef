package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.RecipeProduct;
import com.example.butlerchef_backend.Services.AddressService;
import com.example.butlerchef_backend.Services.RecipeProductService;
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
@RequestMapping("/api/recipeProduct")
public class RecipeProductController {
    private final RecipeProductService recipeProductService;

    @Autowired
    public RecipeProductController(RecipeProductService recipeProductService) {
        this.recipeProductService = recipeProductService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createRecipeProduct(@Valid @RequestBody RecipeProduct recipeProduct){
        RecipeProduct new_recipeProduct=recipeProductService.create(recipeProduct);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Recipe Product created successfully");
        responseMap.put("data", new_recipeProduct);

        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getRecipeProductInfo(@PathVariable Long id){
        Collection<RecipeProduct> recipeProductCollection = recipeProductService.read(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", recipeProductCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateRecipeProductInfo(@Valid @RequestBody RecipeProduct recipeProduct){
        RecipeProduct new_recipeProduct = recipeProductService.update(recipeProduct);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("Recipe Product updated successfully", new_recipeProduct);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteRecipeProduct(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Recipe Product deleted successfully");
        recipeProductService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}
