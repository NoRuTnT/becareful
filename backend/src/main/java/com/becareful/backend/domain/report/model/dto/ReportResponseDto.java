package com.becareful.backend.domain.report.model.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReportResponseDto {
    private String location;
    private String detail;
    private String imgName;
}
