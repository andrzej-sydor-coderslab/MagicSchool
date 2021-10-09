package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
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

    @NotBlank
    @ManyToOne
    private Race race;

    @NotBlank
    private String gender;

    @NotBlank
    private int age;

    @NotBlank
    private int lifePoints = 10;

    @NotBlank
    private int attackPoints = 10;

    @NotBlank
    private int defencePoints = 10;

    @NotBlank
    @ManyToOne
    private Background background;

    @NotBlank
    @Size(max = 500)
    private String history;

    @NotBlank
    private int level = 1;

    @NotBlank
    private int experience = 0;

    @NotBlank
    @ManyToOne
    private University university;

    @NotBlank
    @OneToMany
    private List<Spell> spellBook = new ArrayList<>();

    @NotBlank
    private int numberOfSpells;

    @NotBlank
    @OneToOne
    @JoinColumn(name = "user_id", unique = true)
    private User user;

}