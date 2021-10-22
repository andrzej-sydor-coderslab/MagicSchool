package com.arevas.MagicSchool.dao;

import com.arevas.MagicSchool.entity.User;
import com.arevas.MagicSchool.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class UserDao {

    private final UserRepository userRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public UserDao(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findById(long id) {
        return entityManager.find(User.class, id);
    }

    public void persist(User user){
        entityManager.persist(user);
    }

    public User merge(User user) {
        return entityManager.merge(user);
    }

    public void remove(User user) {
        entityManager.remove(entityManager.contains(user) ? user : entityManager.merge(user));
    }

    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public User login(String email,String password){
        User logUser = userRepository.findByEmail(email);
        if (logUser == null) {
            return null;
        }
        if (logUser.getEmail().equals(email)&&BCrypt.checkpw(password, logUser.getPassword())) {
            return logUser;
        }
        return null;
    }

}