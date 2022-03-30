package com.example.butlerchef_backend.Models;

import java.util.List;

public class RecipeFullCard{
    public Recipe recipe;
    public List<RecipeProduct> products;
    public List<RecipeDirection> directions;

    public RecipeFullCard(Recipe recipe, List<RecipeProduct> products, List<RecipeDirection> directions) {
        this.recipe = recipe;
        this.products = products;
        this.directions = directions;
    }


    @Override
    public String toString() {
        return "RecipeFullCard{" +
                "recipe=" + recipe +
                ", products=" + products +
                ", directions=" + directions +
                '}';
    }
}