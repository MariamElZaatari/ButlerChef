package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.*;
import com.example.butlerchef_backend.Repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service

public class RecipeDirectionService {
    private final RecipeDirectionRepository recipeDirectionRepository;
    private final RecipeRepository recipeRepository;

    @Autowired
    public RecipeDirectionService(RecipeDirectionRepository recipeDirectionRepository, RecipeRepository recipeRepository) {
        this.recipeDirectionRepository = recipeDirectionRepository;
        this.recipeRepository = recipeRepository;
    }

    public Collection<RecipeDirection> read(long id){
        return recipeDirectionRepository.findByRecipeId(id);
    }

    public RecipeDirection create(RecipeDirection recipeDirection) {
        Recipe recipe=recipeRepository.findById(recipeDirection.getRecipe().getId()).get();
        recipeDirection.setRecipe(recipe);
        recipeDirection.setTitle(recipeDirection.getTitle());
        recipeDirection.setContent(recipeDirection.getContent());
        recipeDirection.setCreatedAt();
        return recipeDirectionRepository.save(recipeDirection);
    }

    public RecipeDirection update(RecipeDirection recipeDirection){
        RecipeDirection oldRecipeDirection=recipeDirectionRepository.findById(recipeDirection.getId()).get();
        oldRecipeDirection.setTitle(recipeDirection.getTitle());
        oldRecipeDirection.setContent(recipeDirection.getContent());
        oldRecipeDirection.setUpdatedAt();
        return recipeDirectionRepository.save(oldRecipeDirection);
    }

    public void delete(Long id){
        recipeDirectionRepository.deleteById(id);
    }
}
