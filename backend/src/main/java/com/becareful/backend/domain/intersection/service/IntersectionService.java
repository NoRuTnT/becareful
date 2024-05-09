package com.becareful.backend.domain.intersection.service;

import com.becareful.backend.domain.intersection.model.dto.CoordinateDto;
import com.becareful.backend.domain.intersection.model.dto.CrosswalkResponseDto;
import com.becareful.backend.domain.intersection.model.dto.IntersectionResponseDto;
import com.becareful.backend.domain.intersection.model.entity.Intersection;
import com.becareful.backend.domain.intersection.model.entity.crosswalk;
import com.becareful.backend.domain.intersection.repository.CrosswalkRepository;
import com.becareful.backend.domain.intersection.repository.IntersectionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

@Service
public class IntersectionService {
    private static IntersectionRepository intersectionRepository;
    private static CrosswalkRepository crosswalkRepository;

    public IntersectionResponseDto getIntersectionResponseDto(Long intersectionId){
        List<crosswalk> crosswalkresponse = getIntersection(intersectionId);

        List<CrosswalkResponseDto> crosswalkResponseDtoList = crosswalkresponse.stream()
                .map(crosswalk -> {
                    List<CoordinateDto> coordinates = List.of(
                            getCoordinateDto(crosswalk.getPointOne()),
                            getCoordinateDto(crosswalk.getPointTwo()),
                            getCoordinateDto(crosswalk.getPointThree()),
                            getCoordinateDto(crosswalk.getPointFour())
                    );

                    List<CoordinateDto> midpoints = List.of(
                            getCoordinateDto(crosswalk.getMidpointOne()),
                            getCoordinateDto(crosswalk.getMidpointTwo())
                    );

                    return CrosswalkResponseDto.builder()
                            .crosswalkId(crosswalk.getCrosswalkId())
                            .direction(crosswalk.getDirection())
                            .length(crosswalk.getLength())
                            .sideOne(crosswalk.getSideOne())
                            .sideTwo(crosswalk.getSideTwo())
                            .coordinateList(coordinates)
                            .midpointList(midpoints)
                            .build();
                })
                .collect(Collectors.toList());


        IntersectionResponseDto intersectionResponseDto = IntersectionResponseDto.builder()
                .intersectionId(intersectionId)
                .crosswalkList(crosswalkResponseDtoList)
                .build();

        return  intersectionResponseDto;
    }
    public List<crosswalk> getIntersection(Long intersectionId){
        Intersection intersection = intersectionRepository.getById(intersectionId);
        List<crosswalk> response = crosswalkRepository.findCrosswalk(intersection);

        return response;
    }

    public CoordinateDto getCoordinateDto(String coordinate){
        StringTokenizer st = new StringTokenizer(coordinate , ",");
        return new CoordinateDto(st.nextToken() , st.nextToken());
    }

}