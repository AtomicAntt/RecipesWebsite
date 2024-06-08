package com.example.recipeswebsite;

import com.example.recipeswebsite.Model.User;
import com.example.recipeswebsite.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    final private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User authenticateUser(String username, String password){
        User user = userRepository.findByUsername(username);
        if (user != null){
            if (user.getPassword().equals(password)){
                return user;
            }
        }
        return null;
    }


}
