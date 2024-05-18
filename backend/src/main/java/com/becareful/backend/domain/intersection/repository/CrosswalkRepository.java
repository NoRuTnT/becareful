package com.becareful.backend.domain.intersection.repository;


import com.becareful.backend.domain.intersection.model.entity.Intersection;
import com.becareful.backend.domain.intersection.model.entity.crosswalk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CrosswalkRepository extends JpaRepository<crosswalk, Long> {

    @Query("SELECT h FROM crosswalk h WHERE h.intersection = :intersection")
    List<crosswalk> findCrosswalk(Intersection intersection);

}