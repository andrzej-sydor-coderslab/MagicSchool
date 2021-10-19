package com.arevas.MagicSchool.dao;

import com.arevas.MagicSchool.entity.University;
import com.arevas.MagicSchool.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class UniversityDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<University> findAllUniversities() {
        Query query = entityManager.createQuery("SELECT university from University university ORDER BY university.pointsInRaking DESC");
        return query.getResultList();
    }

    public University findById(long id) {
        return entityManager.find(University.class, id);
    }
}
