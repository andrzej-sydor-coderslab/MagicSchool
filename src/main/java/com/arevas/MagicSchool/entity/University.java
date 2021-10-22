package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name = "universities")
public class University {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Size(max = 1000)
    private String description;

    @ManyToMany
    private List<Wizard> wizards = new ArrayList<>();

    @ManyToMany
    private List<Spell> spells = new ArrayList<>();

    private long pointsInRaking;

    @Override
    public String toString() {
        return name;
    }
}