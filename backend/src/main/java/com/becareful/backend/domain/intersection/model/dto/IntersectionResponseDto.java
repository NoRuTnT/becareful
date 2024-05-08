package com.becareful.backend.domain.intersection.model.dto;

import com.becareful.backend.domain.intersection.model.entity.crosswalk;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class IntersectionResponseDto {

    Long intersectionId;
    List<crosswalk> crosswalkList;

    public IntersectionResponseDto(Long intersectionId, List<crosswalk> crosswalkList) {
        this.intersectionId = intersectionId;
        this.crosswalkList = crosswalkList;
    }
}
