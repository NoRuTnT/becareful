package com.becareful.backend.domain.intersection.model.dto;

import com.becareful.backend.domain.intersection.model.entity.Intersection;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class CrosswalkResponseDto {

    Long crosswalkId;

    String direction;

    String length;

    String sideOne;

    String sideTwo;

    List<CoordinateDto> coordinateList;

    List<CoordinateDto> midpointList;

    public CrosswalkResponseDto(Long crosswalkId, String direction, String length, String sideOne,  String sideTwo, List<CoordinateDto> coordinateList, List<CoordinateDto> midpointList) {
        this.crosswalkId = crosswalkId;
        this.direction = direction;
        this.length = length;
        this.sideOne = sideOne;
        this.sideTwo = sideTwo;
        this.coordinateList = coordinateList;
        this.midpointList = midpointList;
    }
}
