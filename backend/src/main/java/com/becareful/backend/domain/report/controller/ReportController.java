package com.becareful.backend.domain.report.controller;

import com.becareful.backend.common.model.dto.SuccessResponse;
import com.becareful.backend.domain.report.model.dto.ReportResponseDto;
import com.becareful.backend.domain.report.service.ReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Slf4j
@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/api")
public class ReportController {

    private final ReportService reportService;

    @PostMapping(value = "/report")
    public ResponseEntity<SuccessResponse> createProduct(@RequestBody(required = false) ReportResponseDto reportResponseDto) {
        String presignedUrl = reportService.createReport(reportResponseDto);
        SuccessResponse response = SuccessResponse.builder()
            .status(HttpStatus.OK)
            .message("success")
            .result(presignedUrl)
            .build();

        return ResponseEntity.ok(response);
    }
}
