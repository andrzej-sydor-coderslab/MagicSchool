package com.arevas.MagicSchool.repository;

import com.arevas.MagicSchool.entity.Spell;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpellRepository extends JpaRepository<Spell, Long> {
}
