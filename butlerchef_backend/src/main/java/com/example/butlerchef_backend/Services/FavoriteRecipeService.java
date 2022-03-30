package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.FavoriteRecipe;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.CookedRecipeRepository;
import com.example.butlerchef_backend.Repositories.FavoriteRecipeRepository;
import com.example.butlerchef_backend.Repositories.RecipeRepository;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collection;
import java.util.Optional;

@Service
public class FavoriteRecipeService {
    private final FavoriteRecipeRepository favoriteRecipeRepository;
    private final UserRepository userRepository;
    private final RecipeRepository recipeRepository;

    @Autowired
    public FavoriteRecipeService(FavoriteRecipeRepository favoriteRecipeRepository, UserRepository userRepository, RecipeRepository recipeRepository) {
        this.favoriteRecipeRepository = favoriteRecipeRepository;
        this.userRepository=userRepository;
        this.recipeRepository=recipeRepository;
    }

    public FavoriteRecipe create(Long userId, Long recipeId){
        FavoriteRecipe favoriteRecipe= new FavoriteRecipe();
        Optional<User> user= userRepository.findById(userId);
        Optional<Recipe> recipe=recipeRepository.findById(recipeId);

//        if(!(user.isPresent() && recipe.isPresent()))
//            throw new Exception("user or recipe does not found");

        favoriteRecipe.setUser(user.get());
        favoriteRecipe.setRecipe(recipe.get());
        favoriteRecipe.setCreatedAt();
        favoriteRecipe.setUpdatedAt();
        return favoriteRecipeRepository.save(favoriteRecipe);
    }

    public Collection<FavoriteRecipe> read(long id){
        return favoriteRecipeRepository.findByUserIdOrderByCreatedAtDesc(id);
    }

    public Collection<FavoriteRecipe> getByUserIdAndRecipeName(Long id, String name){
        return favoriteRecipeRepository.findByUserIdAndRecipeNameLikeIgnoreCaseOrderByRecipeNameAsc(id, "%"+name+"%");
    }

    @Transactional
    public void delete(Long userId, Long recipeId){
        favoriteRecipeRepository.deleteByRecipeIdAndUserId(userId, recipeId);
    }
}

