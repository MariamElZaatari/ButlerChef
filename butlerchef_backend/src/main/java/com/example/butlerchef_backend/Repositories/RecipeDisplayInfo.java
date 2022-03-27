package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Recipe;

public interface RecipeDisplayInfo {
    Recipe getRecipe();
    Long getTotal();
    Long getFridge();
    Long getFavorite();
    Long getCooked();
}
