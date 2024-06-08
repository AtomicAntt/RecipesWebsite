package com.example.recipeswebsite.Repositories;

import com.example.recipeswebsite.Model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
    User findByUsername(String username);
}
