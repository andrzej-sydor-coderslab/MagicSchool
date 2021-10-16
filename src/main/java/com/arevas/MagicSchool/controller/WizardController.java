package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.*;
import com.arevas.MagicSchool.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@SessionAttributes("logUser")
public class WizardController {

    private final WizardDao wizardDao;
    private final RaceDao raceDao;
    private final BackgroundDao backgroundDao;
    private final UniversityDao universityDao;
    private final SpellDao spellDao;
    private final UserDao userDao;

    public WizardController(WizardDao wizardDao, RaceDao raceDao, BackgroundDao backgroundDao, UniversityDao universityDao, SpellDao spellDao, UserDao userDao) {
        this.wizardDao = wizardDao;
        this.raceDao = raceDao;
        this.backgroundDao = backgroundDao;
        this.universityDao = universityDao;
        this.spellDao = spellDao;
        this.userDao = userDao;
    }

    @ModelAttribute("races")
    public List<Race> allRaces() {
        return raceDao.findAllRaces();
    }

    @ModelAttribute("backgrounds")
    public List<Background> allBackgrounds() {
        return backgroundDao.findAllBackgrounds();
    }

    @ModelAttribute("universities")
    public List<University> allUniversities() {
        return universityDao.findAllUniversities();
    }

    @ModelAttribute("spells")
    private List<Spell> allSpellsInFirstSpellBook() {
        return spellDao.findAllSpellsWhereWizardLvlIsOne();
    }

    @GetMapping("/app/addWizard")
    public String add(Model model) {
        model.addAttribute("wizard", new Wizard());
        return "views/wizardAdd";
    }

    @PostMapping("app/addWizard")
    public String wizardAdd(@Valid Wizard wizard, BindingResult result, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        if (result.hasErrors()) {
            return "views/wizardAdd";
        }
        wizardDao.persist(wizard);
        user.setWizard(wizard);
        userDao.merge(user);
        return "views/wizardPanel";
    }
}
