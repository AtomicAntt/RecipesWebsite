package com.example.recipeswebsite;

import com.example.recipeswebsite.Model.User;
import com.example.recipeswebsite.Repositories.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class IndexController {
    private final UserRepository userRepository;

    final private UserService userService;

    public IndexController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @RequestMapping("/")
    public String index(Model model, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);

        boolean isAdmin = false;

        if (user != null){
            isAdmin = user.isAdmin();
        }

        model.addAttribute("isAdmin", isAdmin);
        return "main";
    }

    @GetMapping("/about")
    public String about(Model model){
        return "about";
    }

    @GetMapping("/login")
    public String login(Model model){
        return "login";
    }

    @PostMapping("/login")
    public String login(String username, String password, HttpServletResponse response, Model model){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            Cookie userCookie = new Cookie("username", username);
            userCookie.setHttpOnly(true);
            userCookie.setPath("/");

            Cookie passwordCookie = new Cookie("password", password);
            passwordCookie.setHttpOnly(true);
            passwordCookie.setPath("/");

            response.addCookie(userCookie);
            response.addCookie(passwordCookie);

            return "redirect:/";
        }
        else{
            model.addAttribute("error", "Invalid Credentials");
        }

        return "login";
    }

    @PostMapping("/signout")
    public String signout(HttpServletResponse response){
        Cookie userCookie = new Cookie("username", "n/a");
        userCookie.setHttpOnly(true);
        userCookie.setPath("/");

        Cookie passwordCookie = new Cookie("password", "n/a");
        passwordCookie.setHttpOnly(true);
        passwordCookie.setPath("/");

        response.addCookie(userCookie);
        response.addCookie(passwordCookie);

        return "redirect:/";
    }
}
