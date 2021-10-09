package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.UserDao;
import com.arevas.MagicSchool.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class MainController {

    private final UserDao userDao;

    public MainController(UserDao userDao) {
        this.userDao = userDao;
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
        User logUser= userDao.login(email, password);
        HttpSession session = request.getSession();
        if(logUser == null){
            return "views/login";
        } else {
            session.setAttribute("logUser", logUser);
            return "redirect:/app/userPanel";
        }
    }

    @GetMapping("/register")
    public String userAdd(Model model){
        model.addAttribute("user", new User());
        return "views/register";
    }
    @PostMapping("/register")
    public String register(User user, BindingResult result){
        if (result.hasErrors()) {
            return "views/register";
        }
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
    public String merge(@RequestParam int idToMerge, Model model) {
        model.addAttribute("user", userDao.findById(idToMerge));
        return "views/userEdit";
    }

    @PostMapping("/app/userPanel/merge")
    public String userMerge(@Valid User user, BindingResult result, HttpServletRequest request ) {
        String email = user.getEmail();
        String password = user.getPassword();
        User logUser= userDao.login(email, password);
        HttpSession session = request.getSession();
        if (result.hasErrors()) {
            System.out.println("Coś poszło nie tak");
            return "views/userEdit";
        }
        session.setAttribute("logUser", logUser);
        user.setPassword(UserDao.hashPassword(password));
        userDao.merge(user);
        return "redirect:/app/userPanel";
    }

    @GetMapping("/app/userPanel/remove")
    public String userRemove(@RequestParam int idToRemove, Model model){
        model.addAttribute("user", userDao.findById(idToRemove));
        return "/views/userRemove";
    }

    @PostMapping("/app/userPanel/remove")
    public String remove(@RequestParam String confirmed, @RequestParam int idToRemove, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        if ("yes".equals(confirmed)){
            User user = userDao.findById(idToRemove);
            userDao.remove(user);
            session.removeAttribute("logUser");
            return "redirect:/index";
        }
        return "redirect:/app/userPanel";
    }
}
