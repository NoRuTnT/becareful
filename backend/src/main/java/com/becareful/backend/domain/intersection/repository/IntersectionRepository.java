package com.becareful.backend.domain.intersection.repository;


import com.becareful.backend.domain.intersection.model.entity.Intersection;
import com.becareful.backend.domain.report.model.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IntersectionRepository extends JpaRepository<Intersection, Long> {
}

