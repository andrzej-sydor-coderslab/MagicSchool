package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name = "spells")
public class Spell {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, unique = true)
    @Size(min = 2, max = 20)
    private String name;

    @NotBlank
    @Size(max = 1000)
    private String description;

    @NotBlank
    @ManyToOne
    private University university;

    @NotBlank
    private int wizardLevelRequired;

    public String toStringSpell() {
        return name;
    }
}