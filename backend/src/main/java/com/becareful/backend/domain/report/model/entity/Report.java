package com.becareful.backend.domain.report.model.entity;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
@Entity
public class Report {

    @Id
    @Column(name = "report_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private Long reportId;

    @Column(name = "location" , nullable = false)
    private String location;

    @Column(name = "img_url")
    private String imgUrl;

    @Column(name = "report_detail")
    private String reportDetail;

    public Report(String location , String imgUrl , String reportDetail){
        this.location = location;
        this.imgUrl = imgUrl;
        this.reportDetail = reportDetail;
    }

}
