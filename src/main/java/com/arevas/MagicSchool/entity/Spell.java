package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
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

    @NotEmpty
    @Column(nullable = false, unique = true)
    @Size(min = 2, max = 20)
    private String name;

    @NotEmpty
    @Size(max = 1000)
    private String description;

    @ManyToOne
    private University university;

    private int wizardLevelRequired;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "wizard_id", unique = true)
    private Wizard wizardWhoCreatedSpell;

    public String toStringSpell() {
        return name;
    }
}