package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Recipe;

public interface CookedRecipeDisplayInfo {
    Recipe getRecipe();
    Long getTotal();
    Long getFridge();
    Long getFavorite();
}
