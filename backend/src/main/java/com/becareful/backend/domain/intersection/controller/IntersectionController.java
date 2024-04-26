package com.becareful.backend.domain.intersection.controller;

import com.becareful.backend.common.model.dto.SuccessResponse;
import com.becareful.backend.domain.intersection.model.entity.Trafficlight;
import com.becareful.backend.domain.intersection.service.IntersectionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api")
public class IntersectionController {
    private static IntersectionService intersectionService;

    @GetMapping(value = "/intersection")
    public SuccessResponse getIntersection(@RequestPart(value = "IntersectionId") Long intersectionId){
        List<Trafficlight> response = intersectionService.getIntersection(intersectionId);
        return new SuccessResponse(HttpStatus.OK , "success").builder().result(response).build();
    }
}
