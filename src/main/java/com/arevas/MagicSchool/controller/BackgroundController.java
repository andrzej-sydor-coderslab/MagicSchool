package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.BackgroundDao;
import org.springframework.stereotype.Controller;


@Controller
public class BackgroundController {

    private BackgroundDao backgroundDao;

    public BackgroundController(BackgroundDao backgroundDao) {
        this.backgroundDao = backgroundDao;
    }

}
