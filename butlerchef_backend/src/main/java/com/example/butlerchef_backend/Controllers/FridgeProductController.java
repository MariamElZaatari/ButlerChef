package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.FridgeProduct;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.ShopProduct;
import com.example.butlerchef_backend.Services.FridgeProductService;
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
@RequestMapping("/api/fridgeProduct")
public class FridgeProductController {
    private final FridgeProductService fridgeProductService;

    @Autowired
    public FridgeProductController(FridgeProductService fridgeProductService) {
        this.fridgeProductService = fridgeProductService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createFridgeProduct(@Valid @RequestBody FridgeProduct fridgeProduct){
        FridgeProduct new_fridgeProduct=fridgeProductService.create(fridgeProduct);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Fridge Product created successfully");
        responseMap.put("data", new_fridgeProduct);
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getFridgeProductByUser(@PathVariable Long id){
        Collection<FridgeProduct> fridgeProductCollection = fridgeProductService.readByUser(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", fridgeProductCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/search/{id}/{name}")
    public ResponseEntity<Map<String, Object>> getFridgeProductByUserAndName(@PathVariable Long id, @PathVariable String name){
        Collection<FridgeProduct> fridgeProductCollection = fridgeProductService.readByUserAndName(id,name);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", fridgeProductCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateFridgeProductInfo(@Valid @RequestBody FridgeProduct fridgeProduct){
        FridgeProduct new_fridgeProduct = fridgeProductService.update(fridgeProduct);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("Fridge Product updated successfully", new_fridgeProduct);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteFridgeProduct(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Fridge Product deleted successfully");
        fridgeProductService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}