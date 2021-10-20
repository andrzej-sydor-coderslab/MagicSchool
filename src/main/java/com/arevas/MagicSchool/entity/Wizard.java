package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.*;

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

    @NotEmpty
    @Column(nullable = false, unique = true)
    @Size(min = 2, max = 10)
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    private Race race;

    @NotEmpty
    private String gender;

    @Min(1)
    private int age;

    private int lifePoints = 10;

    private int attackPoints = 10;

    private int defencePoints = 10;

    @ManyToOne(fetch = FetchType.EAGER)
    private Background background;

    @NotEmpty
    @Size(max = 800)
    private String history;

    private int level = 1;

    private int experience = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    private University university;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Spell> spellBook = new LinkedHashSet<Spell>();

    private int numberOfSpells = 3;

    public int lvlUp(int experience, int currentLvl) {

        for (int i = 50; i < (experience + 1); i = i + 50) {
            if (i == experience) {
                currentLvl++;
            }
        }
        return currentLvl;
    }

}