package com.becareful.backend.report.controller;

import static org.springframework.http.MediaType.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.becareful.backend.domain.report.model.dto.ReportResponseDto;
import com.becareful.backend.domain.report.model.entity.Report;
import com.becareful.backend.domain.report.repository.ReportRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
@Transactional
public class ReportControllerTest {

	@Autowired
	private ReportRepository reportRepository;

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private WebApplicationContext context;

	@Autowired
	private ObjectMapper objectMapper;

	@Test
	@DisplayName("신고내역등록 - 성공")
	void reportAdd_success() throws Exception {
		//given



		//when
		ReportResponseDto reportResponseDto = new ReportResponseDto("역삼역사거리","보도블럭이 없어요","imageUrl");
		mockMvc.perform(post("/api/report")
				.contentType(APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(reportResponseDto)))
			.andExpect(status().isOk())
			.andDo(print());

		//then
		Report savereport = reportRepository.findAll().get(0);
		Assertions.assertThat(savereport.getReportDetail()).isEqualTo(reportResponseDto.getDetail());
		Assertions.assertThat(savereport.getLocation()).isEqualTo(reportResponseDto.getLocation());
		Assertions.assertThat(savereport.getImgUrl()).isEqualTo(reportResponseDto.getImgName());




	}
}
