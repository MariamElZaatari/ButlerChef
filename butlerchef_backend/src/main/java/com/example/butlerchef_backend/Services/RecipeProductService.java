package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.*;
import com.example.butlerchef_backend.Repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Optional;

@Service
public class RecipeProductService {
    private final RecipeProductRepository recipeProductRepository;
    private final RecipeRepository recipeRepository;
    private final MeasurementRepository measurementRepository;
    private final QuantityRepository quantityRepository;

    @Autowired
    public RecipeProductService(RecipeProductRepository recipeProductRepository, RecipeRepository recipeRepository, MeasurementRepository measurementRepository, QuantityRepository quantityRepository) {
        this.recipeProductRepository = recipeProductRepository;
        this.recipeRepository = recipeRepository;
        this.measurementRepository = measurementRepository;
        this.quantityRepository=quantityRepository;
    }

    public Collection<RecipeProduct> read(long id){
        return recipeProductRepository.findByRecipeId(id);
    }

    public RecipeProduct create(RecipeProduct recipeProduct) {
        Recipe recipe=recipeRepository.findById(recipeProduct.getRecipe().getId()).get();
        Measurement measurement=measurementRepository.findMeasurementById(recipeProduct.getMeasurement().getId()).get();
        Quantity quantity=quantityRepository.findById(recipeProduct.getQuantity().getId()).get();
//        Measurement measurement=recipeProduct.getMeasurement();
//        Quantity quantity=recipeProduct.getQuantity();
        recipeProduct.setRecipe(recipe);
        recipeProduct.setMeasurement(measurement);
        recipeProduct.setQuantity(quantity);
        recipeProduct.setCreatedAt();
        return recipeProductRepository.save(recipeProduct);
    }

    public RecipeProduct update(RecipeProduct recipeProduct){
        RecipeProduct oldRecipeProduct=recipeProductRepository.findById(recipeProduct.getId()).get();
        oldRecipeProduct.setMeasurement(recipeProduct.getMeasurement());
        oldRecipeProduct.setName(recipeProduct.getName());
        oldRecipeProduct.setQuantity(recipeProduct.getQuantity());
        oldRecipeProduct.setUpdatedAt();
        return recipeProductRepository.save(oldRecipeProduct);
    }
    public void delete(Long id){
        recipeProductRepository.deleteById(id);
    }
}
