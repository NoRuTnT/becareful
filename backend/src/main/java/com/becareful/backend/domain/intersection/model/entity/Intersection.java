package com.becareful.backend.domain.intersection.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
//@Builder
@Entity
public class Intersection {

    @Id
    @Column(name = "intersection_id")
    private Long intersectionId;

    @Column(name = "intersection_name")
    private String intersectionName;

}
