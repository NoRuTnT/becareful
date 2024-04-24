package com.becareful.backend.domain.report.service;

import com.amazonaws.services.s3.AmazonS3;
import com.becareful.backend.common.service.S3UploaderService;
import com.becareful.backend.domain.report.model.dto.ReportResponseDto;
import com.becareful.backend.domain.report.model.entity.Report;
import com.becareful.backend.domain.report.repository.ReportRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReportService {
    private S3UploaderService s3UploaderService;
    private AmazonS3 amazonS3;
    @Value("${amazon.aws.bucket}")
    private String bucket;
    private ReportRepository reportRepository;

    @Transactional
    public String createReport(ReportResponseDto reportResponseDto){

        String fileName = s3UploaderService.createPath(reportResponseDto.getImgName());
        String preSignedUrl = s3UploaderService.getPreSignedUrl(fileName);
        String imageUrl = amazonS3.getUrl(bucket, fileName).toString();

        Report report = Report.builder()
                .reportDetail(reportResponseDto.getDetail())
                .imgUrl(imageUrl)
                .location(reportResponseDto.getLocation())
                .build();

        reportRepository.save(report);

        return preSignedUrl;
    }
}
