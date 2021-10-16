package com.arevas.MagicSchool.controller;

import com.arevas.MagicSchool.dao.UniversityDao;
import org.springframework.stereotype.Controller;

@Controller
public class UniversityController {

    private UniversityDao universityDao;

    public UniversityController(UniversityDao universityDao) {
        this.universityDao = universityDao;
    }
}
