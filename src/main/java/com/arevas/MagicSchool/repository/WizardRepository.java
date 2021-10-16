package com.arevas.MagicSchool.repository;

import com.arevas.MagicSchool.entity.Wizard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WizardRepository extends JpaRepository<Wizard, Long> {

    Wizard findByName(String name);

}
