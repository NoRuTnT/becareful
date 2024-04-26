package com.becareful.backend.domain.intersection.service;

import com.becareful.backend.domain.intersection.model.entity.Intersection;
import com.becareful.backend.domain.intersection.model.entity.Trafficlight;
import com.becareful.backend.domain.intersection.repository.IntersectionRepository;
import com.becareful.backend.domain.intersection.repository.TrafficlightRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IntersectionService {
    private static IntersectionRepository intersectionRepository;
    private static TrafficlightRepository trafficlightRepository;
    public List<Trafficlight> getIntersection(Long intersectionId){
        Intersection intersection = intersectionRepository.getById(intersectionId);
        List<Trafficlight> response = trafficlightRepository.findTrafficlight(intersection);

        return response;
    }

}