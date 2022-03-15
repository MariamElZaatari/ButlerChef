package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.CookedRecipeRepository;
import com.example.butlerchef_backend.Repositories.RecipeRepository;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Service
public class CookedRecipeService {
    private final CookedRecipeRepository cookedRecipeRepository;
    private final UserRepository userRepository;
    private final RecipeRepository recipeRepository;


    @Autowired
    public CookedRecipeService(CookedRecipeRepository cookedRecipeRepository, UserRepository userRepository, RecipeRepository recipeRepository) {
        this.cookedRecipeRepository = cookedRecipeRepository;
        this.userRepository=userRepository;
        this.recipeRepository=recipeRepository;
    }

    public CookedRecipe create(Long userId, Long recipeId){
        CookedRecipe cookedRecipe= new CookedRecipe();
        Optional<User> user= userRepository.findById(userId);
        Optional<Recipe> recipe=recipeRepository.findById(recipeId);

//        if(!(user.isPresent() && recipe.isPresent()))
//            throw new Exception("user or recipe does not found");

        cookedRecipe.setUser(user.get());
        cookedRecipe.setRecipe(recipe.get());
        cookedRecipe.setCreatedAt();
        cookedRecipe.setUpdatedAt();
        return cookedRecipeRepository.save(cookedRecipe);
    }

    public Collection<CookedRecipe> read(long id){
        return cookedRecipeRepository.findByUserIdOrderByCreatedAtDesc(id);
    }

    public Collection<CookedRecipe> getByUserIdAndRecipeName(Long id, String name){
        return cookedRecipeRepository.findByUserIdAndRecipeNameLikeIgnoreCaseOrderByRecipeNameAsc(id, "%"+name+"%");
    }

//    public User update(User user){
//        User oldUser=userRepository.findById(user.getId()).get();
//        oldUser.setFirstName(user.getFirstName());
//        oldUser.setLastName(user.getLastName());
//        oldUser.setImage(user.getImage());
//        oldUser.setUpdated_at();
//        return userRepository.save(oldUser);
//    }
    public void delete(Long id){
        cookedRecipeRepository.deleteById(id);
    }
}
