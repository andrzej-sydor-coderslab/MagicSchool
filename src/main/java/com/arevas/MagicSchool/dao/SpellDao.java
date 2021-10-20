package com.arevas.MagicSchool.dao;

import com.arevas.MagicSchool.entity.Spell;
import com.arevas.MagicSchool.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class SpellDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Spell> findAllSpells() {
        Query query = entityManager.createQuery("SELECT spell FROM Spell spell");
        return query.getResultList();
    }

    public List<Spell> findAllSpellsWhereWizardLvlIsOne() {
        Query query = entityManager.createQuery("SELECT spell FROM Spell spell WHERE spell.wizardLevelRequired = 1");
        return query.getResultList();
    }

    public Spell findById(long id) {
        return entityManager.find(Spell.class, id);
    }

    public void persist(Spell spell){
        entityManager.persist(spell);
    }
}
