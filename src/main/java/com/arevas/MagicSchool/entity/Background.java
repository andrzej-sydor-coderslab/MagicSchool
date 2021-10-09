package com.arevas.MagicSchool.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "backgrounds")
public class Background {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Size(max = 500)
    private String description;
}