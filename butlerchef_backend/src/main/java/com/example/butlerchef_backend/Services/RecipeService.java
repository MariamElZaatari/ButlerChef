package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.*;
import com.example.butlerchef_backend.Repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Service
public class RecipeService {

    private final RecipeRepository recipeRepository;
    private final UserRepository userRepository;
    private final RecipeDirectionRepository recipeDirectionRepository;
    private final RecipeProductRepository recipeProductRepository;

    @Autowired
    public RecipeService(RecipeRepository recipeRepository, UserRepository userRepository, RecipeDirectionRepository recipeDirectionRepository, RecipeProductRepository recipeProductRepository) {
        this.recipeRepository = recipeRepository;
        this.userRepository = userRepository;
        this.recipeDirectionRepository = recipeDirectionRepository;
        this.recipeProductRepository = recipeProductRepository;
    }

    public Recipe createRecipe(Recipe recipe) {
        Optional<User> temp_user=userRepository.findById(recipe.getUser().getId());
        User user=temp_user.get();
        recipe.setUser(user);
        return recipeRepository.save(recipe);
    }


    public Collection<Recipe> getRecipesByUserId(Long id){
        return recipeRepository.findByUserIdOrderByCreatedAtDesc(id);
    }

    public Collection<Recipe> getRecipesByUserIdAndRecipeName(Long id, String name){
        return recipeRepository.findByUserIdAndNameLikeIgnoreCaseOrderByNameAsc(id,"%"+name+"%");

    }

    public Collection<RecipeDisplayInfo> getRecipesDisplayInfoForLoggedUser(Long id){
        return recipeRepository.getRecipesInfoForLoggedUser(id);
    }

    public Collection<RecipeDisplayInfo> getRecipesByName(Long id, String name){
        return recipeRepository.getRecipesInfoByName(id, name);
    }

    public Collection<FavoriteRecipeDisplayInfo> getFavoriteRecipesDisplayInfoForLoggedUser(Long id){
        return recipeRepository.getFavoriteRecipesInfoForLoggedUser(id);
    }

    public Collection<CookedRecipeDisplayInfo> getCookedRecipesDisplayInfoForLoggedUser(Long id){
        return recipeRepository.getCookedRecipesInfoForLoggedUser(id);
    }

    public Collection<RecipeDisplayInfo> getProfileRecipesDisplayInfoForLoggedUser(Long id){
        return recipeRepository.getProfileRecipesInfoForLoggedUser(id);
    }

    public Recipe update(Recipe recipe){
        Recipe oldRecipe=recipeRepository.findById(recipe.getId()).get();
        oldRecipe.setName(recipe.getName());
        oldRecipe.setImageUrl(recipe.getImageUrl());
        oldRecipe.setServing(recipe.getServing());
        oldRecipe.setLevel(recipe.getLevel());
        oldRecipe.setRate(recipe.getRate());
        oldRecipe.setTime(recipe.getTime());
        oldRecipe.setVisibility(recipe.getVisibility());
        oldRecipe.setUpdatedAt();
        return recipeRepository.save(oldRecipe);
    }

    public void delete(Long id){
        recipeRepository.deleteById(id);
    }

    @Transactional
    public boolean createFullRecipe(Recipe recipe,
                                    List<RecipeProduct> products,
                                    List<RecipeDirection> directions) {

        try{
            Recipe createdRecipe = recipeRepository.save(recipe);

            for (RecipeProduct product : products) {
                product.setRecipe(createdRecipe);
                recipeProductRepository.addProduct(
                        product.getRecipe().getId(),
                        product.getQuantity().getId(),
                        product.getMeasurement().getId(),
                        product.getName(),
                        product.getCreatedAt(),
                        product.getUpdatedAt()
                );
                System.out.println("Product Added");

            }

            for (RecipeDirection direction : directions) {
                direction.setRecipe(createdRecipe);
                recipeDirectionRepository.addDirection(
                        direction.getRecipe().getId(),
                        direction.getTitle(),
                        direction.getContent(),
                        direction.getCreatedAt(),
                        direction.getUpdatedAt()
                );
                System.out.println("Direction Added");

            }
            return true;

        }catch (Exception e){
            System.out.println("Error: " + e.toString());
            return false;
        }
    }
}
