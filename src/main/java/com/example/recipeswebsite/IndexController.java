package com.example.recipeswebsite;

import com.example.recipeswebsite.Model.Announcement;
import com.example.recipeswebsite.Model.User;
import com.example.recipeswebsite.Repositories.AnnouncementRepository;
import com.example.recipeswebsite.Repositories.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
public class IndexController {
    private final UserRepository userRepository;
    private final AnnouncementRepository announcementRepository;

    final private UserService userService;

    public IndexController(UserRepository userRepository, AnnouncementRepository announcementRepository, UserService userService) {
        this.userRepository = userRepository;
        this.announcementRepository = announcementRepository;
        this.userService = userService;
    }

    @RequestMapping("/")
    public String index(Model model, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            model.addAttribute("isAdmin", user.isAdmin());
        }

        model.addAttribute("announcements", announcementRepository.findAll());

        return "main";
    }

    @GetMapping("/about")
    public String about(Model model, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            model.addAttribute("isAdmin", user.isAdmin());
        }
        return "about";
    }

    @GetMapping("/login")
    public String login(Model model, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            model.addAttribute("isAdmin", user.isAdmin());
        }
        return "login";
    }

    @GetMapping("/controlpanel")
    public String controlpanel(Model model, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            if (user.isAdmin()){
                model.addAttribute("isAdmin", user.isAdmin());
                return "controlpanel";
            }
        }
        return "main"; // replace with error page later
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

        return "redirect:login";
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

    @PostMapping("/announce")
    public String announce(String announcement, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            if (user.isAdmin()){
                Announcement newAnnouncement = new Announcement();
                newAnnouncement.setAnnouncement(announcement);
                newAnnouncement.setTimeWritten(LocalDateTime.now());
                announcementRepository.save(newAnnouncement);
            }
        }
        return "redirect:/"; // replace with error page later
    }

    @PostMapping("/deleteAnnouncement")
    public String announce(Integer id, @CookieValue(value="username", defaultValue="n/a") String username, @CookieValue(value="password", defaultValue="n/a") String password){
        User user = userService.authenticateUser(username, password);
        if (user != null){
            if (user.isAdmin()){
                announcementRepository.deleteById(id);
                return "redirect:/";
            }
        }
        return "redirect:/"; // replace with error page later
    }

}
