package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.RecipeProduct;
import com.example.butlerchef_backend.Models.ShopProduct;
import com.example.butlerchef_backend.Services.RecipeProductService;
import com.example.butlerchef_backend.Services.ShopProductService;
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
@RequestMapping("/api/shopProduct")
public class ShopProductController {
    private final ShopProductService shopProductService;

    @Autowired
    public ShopProductController(ShopProductService shopProductService) {
        this.shopProductService = shopProductService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createShopProduct(@Valid @RequestBody ShopProduct shopProduct){
        ShopProduct new_shopProduct=shopProductService.create(shopProduct);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Shop Product created successfully");
        responseMap.put("data", new_shopProduct);
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/")
    public ResponseEntity<Map<String, Object>> getShopProductInfo(){
        Collection<ShopProduct> shopProductCollection = shopProductService.read();
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", shopProductCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/search/{name}")
    public ResponseEntity<Map<String, Object>> getShopProductName(@PathVariable String name){
        Collection<ShopProduct> shopProductCollection = shopProductService.readRecipesByName(name);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", shopProductCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateShopProductInfo(@Valid @RequestBody ShopProduct shopProduct){
        ShopProduct new_shopProduct = shopProductService.update(shopProduct);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("Shop Product updated successfully", new_shopProduct);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteShopProduct(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Shop Product deleted successfully");
        shopProductService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}
