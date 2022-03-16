package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.RecipeRepository;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Optional;

@Service
public class RecipeService {

    private final RecipeRepository recipeRepository;
    private final UserRepository userRepository;

    @Autowired
    public RecipeService(RecipeRepository recipeRepository, UserRepository userRepository) {
        this.recipeRepository = recipeRepository;
        this.userRepository = userRepository;
    }

    public Recipe createRecipe(Recipe recipe) {
        //add validation
        Optional<User> temp_user=userRepository.findById(recipe.getUser().getId());
        User user=temp_user.get();
        recipe.setUser(user);
        return recipeRepository.save(recipe);
    }

    public Collection<Recipe> getRecipesByName(String name){
        return recipeRepository.findByNameLikeIgnoreCaseOrderByNameAsc("%"+name+"%");
    }

    public Collection<Recipe> getRecipesByUserId(Long id){
        return recipeRepository.findByUserIdOrderByCreatedAtDesc(id);
    }

    public Collection<Recipe> getRecipesByUserIdAndRecipeName(Long id, String name){
        return recipeRepository.findByUserIdAndNameLikeIgnoreCaseOrderByNameAsc(id,"%"+name+"%");

    }
}
