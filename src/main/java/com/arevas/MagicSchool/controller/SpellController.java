package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.SpellDao;
import com.arevas.MagicSchool.dao.UniversityDao;
import com.arevas.MagicSchool.dao.WizardDao;
import com.arevas.MagicSchool.entity.Spell;
import com.arevas.MagicSchool.entity.University;
import com.arevas.MagicSchool.entity.User;
import com.arevas.MagicSchool.entity.Wizard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;
import java.util.Set;

@Controller
public class SpellController {

    private SpellDao spellDao;
    private UniversityDao universityDao;
    private WizardDao wizardDao;

    public SpellController(SpellDao spellDao, UniversityDao universityDao, WizardDao wizardDao) {
        this.spellDao = spellDao;
        this.universityDao = universityDao;
        this.wizardDao = wizardDao;
    }

    @GetMapping("/app/spell/create")
    public String createSpell(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        Wizard wizard = user.getWizard();
        University university = wizard.getUniversity();
        Long id = university.getId();
        model.addAttribute("user", user);
        model.addAttribute("spell", new Spell());
        model.addAttribute("university", universityDao.findById(id));
        if (wizard.getLevel() > wizard.getNumberOfSpells()) {
            return "views/createSpell";
        } else {
            return "views/impossibleCreateSpell";
        }
    }

    @PostMapping("/app/spell/create")
    public String finishCreateSpell(Spell spell, BindingResult result, HttpServletRequest request ){
        if (result.hasErrors()) {
            return "views/createSpell";
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        Wizard wizard = user.getWizard();
        University university = wizard.getUniversity();
        spell.setUniversity(university);
        spell.setWizardLevelRequired(wizard.getLevel());
        spell.setWizardWhoCreatedSpell(wizard);
        int currentNumberOfSpells = wizard.getNumberOfSpells();
        currentNumberOfSpells++;
        wizard.setNumberOfSpells(currentNumberOfSpells);
        spellDao.persist(spell);
        wizardDao.merge(wizard);
        return "redirect:/app/university";
    }

    @GetMapping("/app/spell/learn")
    public String learnNewSpell(HttpServletRequest request ){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        Wizard wizard = user.getWizard();
        if (wizard.getLevel() < 4) {
            return "views/noLearnSpell";
        }
        if (wizard.getLevel() == wizard.getNumberOfSpells()) {
            return "views/noLearnSpell";
        }
        if (wizard.getLevel() > wizard.getNumberOfSpells()) {
            Set<Spell> actualSpellList = wizard.getSpellBook();
            Random random = new Random();
            List<Spell> allPossibleSpellsToLearn = spellDao.findAllSpellsByWizardLvl(wizard.getLevel());
            for (int i = 1; i <= allPossibleSpellsToLearn.size(); i++) {
                int newSpellId = random.nextInt(allPossibleSpellsToLearn.size());
                Spell spell = allPossibleSpellsToLearn.get(newSpellId);
                if (actualSpellList.contains(spell)) {
                    continue;
                } else {
                    actualSpellList.add(spell);
                    break;
                }
            }
            wizard.setSpellBook(actualSpellList);
            wizard.setNumberOfSpells(wizard.getLevel());
            wizardDao.merge(wizard);
        }
        return "redirect:/app/university";
    }
}
