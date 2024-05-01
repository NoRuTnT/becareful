package com.becareful.backend.domain.intersection.controller;

import com.becareful.backend.common.model.dto.SuccessResponse;
import com.becareful.backend.domain.intersection.model.entity.Trafficlight;
import com.becareful.backend.domain.intersection.service.IntersectionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api")
public class IntersectionController {
    private final IntersectionService intersectionService;

    @GetMapping(value = "/intersection/{intersectionId}")
    public ResponseEntity<SuccessResponse> getIntersection(@PathVariable Long intersectionId){
        List<Trafficlight> trafficlgihtresponse = intersectionService.getIntersection(intersectionId);
        SuccessResponse response = SuccessResponse.builder()
            .status(HttpStatus.OK)
            .message("성공적으로 신호등이 조회되었습니다")
            .result(trafficlgihtresponse)
            .build();

        return ResponseEntity.ok(response);
    }
}
