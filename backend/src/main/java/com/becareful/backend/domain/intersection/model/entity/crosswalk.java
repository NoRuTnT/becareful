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
public class crosswalk {

    @Id
    @Column(name = "crosswalk_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private Long crosswalkId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "intersection_id")
    private Intersection intersection;

    @Column(name = "direction")
    private String direction;

    @Column(name = "length")
    private String length;

    @Column(name = "point_one")
    private String pointOne;

    @Column(name = "point_two")
    private String pointTwo;

    @Column(name = "point_three")
    private String pointThree;

    @Column(name = "point_four")
    private String pointFour;

    @Column(name = "side_one")
    private String sideOne;

    @Column(name = "side_two")
    private String sideTwo;

    @Column(name = "midpoint_one")
    private String midpointOne;

    @Column(name = "midpoint_two")
    private String midpointTwo;

}
