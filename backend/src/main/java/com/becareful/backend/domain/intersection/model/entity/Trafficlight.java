package com.becareful.backend.domain.intersection.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
@Entity
public class Trafficlight {

    @Id
    @Column(name = "traffic_id")
    private Long trafficId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "intersection_id")
    private Intersection intersection;

    @Column(name = "startpoint")
    private String startpoint;

    @Column(name = "endpoint")
    private String endpoint;

    @Column(name = "direction")
    private String direction;

    @Column(name = "stop_time")
    private String stopTime;

    @Column(name = "walk_time")
    private String walkTime;

}
