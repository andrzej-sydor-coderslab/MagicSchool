package com.arevas.MagicSchool.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false, unique = true)
    @Size(min = 2, max = 10, message = "Login must be at least two and a maximum of ten characters long.")
    private String login;

    @NotBlank
    @Column(nullable = false, unique = true)
    @Email
    private String email;

    @NotEmpty
    @Size(min = 7, message = "Password must be at least seven characters long.")
    private String password;

    private boolean goodMode;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "wizard_id", unique = true)
    private Wizard wizard;

    @Column(name = "created_on")
    private LocalDateTime createdOn;

    @Column(name = "updated_on")
    private LocalDateTime updatedOn;

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate() {
        updatedOn = LocalDateTime.now();
    }

    public String showWizardName() {
        String nameWizard = this.wizard.getName();
        return nameWizard;
    }

    @Override
    public String toString() {
        return login;
    }
}