package com.becareful.backend.domain.intersection.model.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CoordinateDto {
    String longitude;
    String latitude;

    public CoordinateDto(String longitude , String latitude){
        this.longitude = longitude;
        this.latitude = latitude;
    }
}
