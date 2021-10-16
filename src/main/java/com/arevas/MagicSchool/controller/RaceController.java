package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.RaceDao;
import org.springframework.stereotype.Controller;


@Controller
public class RaceController {

    private RaceDao raceDao;

    public RaceController(RaceDao raceDao) {
        this.raceDao = raceDao;
    }

}
