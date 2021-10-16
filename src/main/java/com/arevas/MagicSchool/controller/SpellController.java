package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.SpellDao;
import org.springframework.stereotype.Controller;

@Controller
public class SpellController {

    private SpellDao spellDao;

    public SpellController(SpellDao spellDao) {
        this.spellDao = spellDao;
    }
}
