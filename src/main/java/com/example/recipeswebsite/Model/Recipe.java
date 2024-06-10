package com.example.recipeswebsite.Model;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String recipeTitle;

    @Column(columnDefinition="Text")
    private String recipeIngredients;

    @Column(columnDefinition="Text")
    private String recipeEntry;

    @ManyToMany(mappedBy = "recipes")
    private List<Tag> tags;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRecipeTitle() {
        return recipeTitle;
    }

    public void setRecipeTitle(String recipeTitle) {
        this.recipeTitle = recipeTitle;
    }

    public String getRecipeIngredients() {
        return recipeIngredients;
    }

    public void setRecipeIngredients(String recipeIngredients) {
        this.recipeIngredients = recipeIngredients;
    }

    public String getRecipeEntry() {
        return recipeEntry;
    }

    public void setRecipeEntry(String recipeEntry) {
        this.recipeEntry = recipeEntry;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
}
