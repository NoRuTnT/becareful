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

    List<CoordinateDto> coordinateList;

    public CrosswalkResponseDto(Long crosswalkId, String direction , String length , List<CoordinateDto> coordinateList) {
        this.crosswalkId = crosswalkId;
        this.direction = direction;
        this.length = length;
        this.coordinateList = coordinateList;
    }
}
