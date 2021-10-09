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
@Table(name = "universities")
public class University {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, unique = true)
    private String name;

    @NotBlank
    @Size(max = 500)
    private String description;

    @NotBlank
    @OneToMany
    private List<Wizard> wizards = new ArrayList<>();

    @NotBlank
    @OneToMany
    private List<Spell> spells = new ArrayList<>();

    @NotBlank
    private long pointsInRaking;
}