package com.example.recipeswebsite.Model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    @ManyToMany
    private List<Tag> tags;

    @Lob
    @Column(columnDefinition = "MEDIUMBLOB")
    private byte[] image;

    private LocalDateTime timeWritten;

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

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public LocalDateTime getTimeWritten() {
        return timeWritten;
    }

    public void setTimeWritten(LocalDateTime timeWritten) {
        this.timeWritten = timeWritten;
    }
}
