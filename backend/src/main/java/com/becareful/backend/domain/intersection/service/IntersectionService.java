package com.becareful.backend.domain.intersection.service;

import com.becareful.backend.domain.intersection.model.entity.Intersection;
import com.becareful.backend.domain.intersection.model.entity.crosswalk;
import com.becareful.backend.domain.intersection.repository.CrosswalkRepository;
import com.becareful.backend.domain.intersection.repository.IntersectionRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IntersectionService {
    private static IntersectionRepository intersectionRepository;
    private static CrosswalkRepository crosswalkRepository;
    public List<crosswalk> getIntersection(Long intersectionId){
        Intersection intersection = intersectionRepository.getById(intersectionId);
        List<crosswalk> response = crosswalkRepository.findCrosswalk(intersection);

        return response;
    }

}