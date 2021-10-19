package com.arevas.MagicSchool.dao;

import com.arevas.MagicSchool.entity.Wizard;
import com.arevas.MagicSchool.repository.WizardRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class WizardDao {

    private final WizardRepository wizardRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public WizardDao(WizardRepository wizardRepository) {
        this.wizardRepository = wizardRepository;
    }

    public Wizard findById(long id) {
        return entityManager.find(Wizard.class, id);
    }

    public void persist(Wizard wizard){
        entityManager.persist(wizard);
    }

    public Wizard merge(Wizard wizard) {
        return entityManager.merge(wizard);
    }

    public void remove(Wizard wizard) {
        entityManager.remove(entityManager.contains(wizard) ? wizard : entityManager.merge(wizard));
    }

    public List<Wizard> topTenWizards(int limit) {
        Query query = entityManager.createQuery("SELECT wizard FROM Wizard wizard ORDER BY wizard.experience DESC");
        return query.setMaxResults(limit).getResultList();
    }
}
