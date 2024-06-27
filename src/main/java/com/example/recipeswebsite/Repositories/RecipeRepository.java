package com.example.recipeswebsite.Repositories;

import com.example.recipeswebsite.Model.Recipe;
import org.springframework.data.repository.CrudRepository;

public interface RecipeRepository extends CrudRepository<Recipe, Integer> {
    Recipe findByRecipeTitle(String title);
}
