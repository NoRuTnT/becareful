package com.becareful.backend.domain.report.repository;


import com.becareful.backend.domain.report.model.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReportRepository extends JpaRepository<Report, Long> {
}

