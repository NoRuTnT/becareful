package com.becareful.backend.domain.intersection.model.dto;

import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class IntersectionResponseDto {

    Long intersectionId;
    List<CrosswalkResponseDto> crosswalkList;

    public IntersectionResponseDto(Long intersectionId, List<CrosswalkResponseDto> crosswalkList) {
        this.intersectionId = intersectionId;
        this.crosswalkList = crosswalkList;
    }
}
