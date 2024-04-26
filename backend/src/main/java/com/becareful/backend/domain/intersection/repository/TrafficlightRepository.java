package com.becareful.backend.domain.intersection.repository;


import com.becareful.backend.domain.intersection.model.entity.Intersection;
import com.becareful.backend.domain.intersection.model.entity.Trafficlight;
import com.becareful.backend.domain.report.model.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TrafficlightRepository extends JpaRepository<Trafficlight, Long> {

    @Query("SELECT h FROM Trafficlight h WHERE h.intersection = :intersection")
    List<Trafficlight> findTrafficlight(Intersection intersection);

}