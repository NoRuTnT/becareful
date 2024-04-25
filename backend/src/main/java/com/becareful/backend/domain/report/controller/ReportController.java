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
    private ReportService reportService;

    @PostMapping(value = "/report")
    public SuccessResponse createProduct(@RequestPart(value = "reportDetail") ReportResponseDto reportResponseDto) {
        String presignedUrl = reportService.createReport(reportResponseDto);
        return new SuccessResponse(HttpStatus.OK , "success").builder().result(presignedUrl).build();
    }
}
