package com.arevas.MagicSchool.dao;

import com.arevas.MagicSchool.entity.Race;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class RaceDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Race> findAllRaces() {
        Query query = entityManager.createQuery("SELECT race from Race race");
        return query.getResultList();
    }
}
