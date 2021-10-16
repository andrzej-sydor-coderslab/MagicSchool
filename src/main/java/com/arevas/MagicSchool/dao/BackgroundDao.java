package com.arevas.MagicSchool.dao;

import com.arevas.MagicSchool.entity.Background;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class BackgroundDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Background> findAllBackgrounds() {
        Query query = entityManager.createQuery("SELECT background from Background background");
        return query.getResultList();
    }
}
