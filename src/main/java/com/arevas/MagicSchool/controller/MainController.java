package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.SpellDao;
import com.arevas.MagicSchool.dao.UniversityDao;
import com.arevas.MagicSchool.dao.UserDao;
import com.arevas.MagicSchool.dao.WizardDao;
import com.arevas.MagicSchool.entity.University;
import com.arevas.MagicSchool.entity.User;
import com.arevas.MagicSchool.entity.Wizard;
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
    private final WizardDao wizardDao;
    private final UniversityDao universityDao;

    public MainController(UserDao userDao, WizardDao wizardDao, UniversityDao universityDao) {
        this.userDao = userDao;
        this.wizardDao = wizardDao;
        this.universityDao = universityDao;
    }

    @GetMapping("/index")
    public String mainPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        return "/index";
    }

    @GetMapping("/aboutGame")
    public String aboutGame(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        return "/aboutGame";
    }

    @GetMapping("/contact")
    public String contact(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        return "/contact";
    }

    @GetMapping("/rankings")
    public String rankings(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        model.addAttribute("wizards", wizardDao.topTenWizards(10));
        model.addAttribute("universities", universityDao.findAllUniversities());
        return "/rankings";
    }

    @GetMapping("/login")
    public String userLogin(Model model){
        model.addAttribute("user", new User());
        return "views/login";
    }

    @PostMapping("/login")
    public String login(User user, HttpServletRequest request) {
        String email = user.getEmail();
        String password = user.getPassword();
        User logUser= userDao.login(email, password);
        HttpSession session = request.getSession();
        if(logUser == null){
            return "views/loginReport";
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
    public String register(@Valid User user, BindingResult result, HttpServletRequest request ){
        HttpSession session = request.getSession();
        if (result.hasErrors()) {
            return "views/registerReport";
        }
        String email = user.getEmail();
        String password = user.getPassword();
        user.setPassword(UserDao.hashPassword(password));
        userDao.persist(user);
        User logUser= userDao.login(email, password);
        session.setAttribute("logUser", logUser);
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
        User editUser = userDao.findById(idToMerge);
        editUser.setPassword("");
        model.addAttribute("user", editUser);
        return "views/userEdit";
    }

    @PostMapping("/app/userPanel/merge")
    public String userMerge(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "views/userEdit";
        }
        String password = user.getPassword();
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
    public String remove(@RequestParam String confirmed, @RequestParam int idToRemove, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if ("yes".equals(confirmed)){
            User user = userDao.findById(idToRemove);
            Wizard wizard = user.getWizard();
            userDao.remove(user);
            University university = wizard.getUniversity();
            university.setPointsInRaking(university.getPointsInRaking() - wizard.getExperience());
            universityDao.merge(university);
            wizardDao.remove(wizard);

            session.removeAttribute("logUser");
            return "redirect:/index";
        }
        return "redirect:/app/userPanel";
    }

    @GetMapping("/app/game")
    public String startGame(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        model.addAttribute("wizard", user.getWizard());
        if (user.getWizard() == null) {
            return "views/wizardAdd";
        }
        return "views/game";
    }

    @GetMapping("/app/game/positiveEnd")
    public String positiveFinishGame(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        model.addAttribute("wizard", user.getWizard());
        return "views/positiveEndGame";
    }

    @PostMapping("/app/game/positiveEnd")
    public String addPoints(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        Wizard wizard = user.getWizard();
        int currentPointsWizard = wizard.getExperience();
        wizard.setExperience(currentPointsWizard + 5);
        University university = wizard.getUniversity();
        Long id = university.getId();
        University finalUniversity = universityDao.findById(id);
        long currentPointsUniversity = university.getPointsInRaking();
        finalUniversity.setPointsInRaking(currentPointsUniversity + 5);
        int lvl = wizard.lvlUp(wizard.getExperience(), wizard.getLevel());
        wizard.setLevel(lvl);
        wizardDao.merge(wizard);
        universityDao.merge(finalUniversity);
        return "redirect:/app/wizardPanel";
    }

    @GetMapping("/app/game/negativeEnd")
    public String negativeFinishGame(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        model.addAttribute("user", user);
        model.addAttribute("wizard", user.getWizard());
        return "views/negativeEndGame";
    }

    @GetMapping("/app/university")
    public String viewUniversity(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        Wizard wizard = user.getWizard();
        University university = wizard.getUniversity();
        Long id = university.getId();
        model.addAttribute("user", user);
        model.addAttribute("wizard", wizard);
        model.addAttribute("university", universityDao.findById(id));
        return "views/university";
    }

    @GetMapping("/app/university/chat")
    public String chat(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        Wizard wizard = user.getWizard();
        University university = wizard.getUniversity();
        Long id = university.getId();
        model.addAttribute("user", user);
        model.addAttribute("wizard", wizard);
        model.addAttribute("university", universityDao.findById(id));
        return "views/universityChat";
    }
}
