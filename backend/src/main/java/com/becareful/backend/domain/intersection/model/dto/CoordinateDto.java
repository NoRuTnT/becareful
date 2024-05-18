package com.becareful.backend.domain.intersection.model.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CoordinateDto {
    String latitude;
    String longitude;

    public CoordinateDto(String latitude ,String longitude){
        this.latitude = latitude;
        this.longitude = longitude;
    }
}
