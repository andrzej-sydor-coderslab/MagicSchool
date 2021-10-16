package com.arevas.MagicSchool.repository;

import com.arevas.MagicSchool.entity.Background;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BackgroundRepository extends JpaRepository<Background, Long> {
}
