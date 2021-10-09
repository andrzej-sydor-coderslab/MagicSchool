package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.UserDao;
import com.arevas.MagicSchool.entity.User;
import com.arevas.MagicSchool.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    private final UserDao userDao;
    private final UserRepository userRepository;

    public MainController(UserDao userDao, UserRepository userRepository) {
        this.userDao = userDao;
        this.userRepository = userRepository;
    }

    @GetMapping("/index")
    public String mainPage() {
        return "/index";
    }

    @GetMapping("/login")
    public String userLogin(Model model){
        model.addAttribute("user", new User());
        return "views/login";
    }

    @PostMapping("/login")
    public String login(User user, HttpServletRequest request){
        String email = user.getEmail();
        String password = user.getPassword();
        Long id = user.getId();
        String login = user.getLogin();
        User logUser= userDao.login(email, password);
        HttpSession session = request.getSession();
        if(logUser == null){
            return "views/login";
        } else {
            userDao.login(email, password);
            session.setAttribute("logUser", user);
            return "redirect:/app/userPanel";
        }
    }

    @GetMapping("/register")
    public String userAdd(Model model){
        model.addAttribute("user", new User());
        return "views/register";
    }
    @PostMapping("/register")
    public String register(User user){
        String password = user.getPassword();
        user.setPassword(UserDao.hashPassword(password));
        userDao.persist(user);
        return "views/userPanel";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("logUser");
        return "redirect:/index";
    }

    @GetMapping("/app/userPanel")
    public String userPanel(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        return "views/userPanel";
    }

    @GetMapping("/app/userPanel/merge")
    public String merge(@RequestParam long id, Model model) {
        model.addAttribute("user", userDao.findById(id));
        return "views/userEdit";
    }

    @PostMapping("/app/userPanel/merge")
    public String userMerge(User user){
        userDao.merge(user);
        return "redirect:/views/userPanel";
    }

    @GetMapping("/app/userPanel/remove")
    public String userRemove(@RequestParam long id, Model model){
        model.addAttribute("user", userDao.findById(id));
        return "/views/userRemove";

    }
    @PostMapping("/app/userPanel/remove")
    public String remove(User user) {
        userDao.remove(user);
        return "/logout";
    }
}
