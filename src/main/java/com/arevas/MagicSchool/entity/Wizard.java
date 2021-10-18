package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name = "wizards")
public class Wizard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, unique = true)
    @Size(min = 2, max = 10)
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    private Race race;

    @NotBlank
    private String gender;

    @Min(1)
    private int age;

    private int lifePoints = 10;

    private int attackPoints = 10;

    private int defencePoints = 10;

    @ManyToOne(fetch = FetchType.EAGER)
    private Background background;

    @NotBlank
    @Size(max = 800)
    private String history;

    private int level = 1;

    private int experience = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    private University university;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Spell> spellBook = new ArrayList<Spell>();

    private int numberOfSpells = 3;

}