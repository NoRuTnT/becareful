package com.becareful.backend.domain.intersection.repository;


import com.becareful.backend.domain.intersection.model.entity.Intersection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IntersectionRepository extends JpaRepository<Intersection, Long> {
}

