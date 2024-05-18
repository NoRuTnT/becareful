package com.becareful.backend.common.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.becareful.backend.common.model.dto.SuccessResponse;
import com.becareful.backend.common.service.S3UploaderService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/file")
@RequiredArgsConstructor
public class FileController {

	private final S3UploaderService s3UploaderService;

	@PostMapping("/upload-url")
	public ResponseEntity<SuccessResponse> getPresignedUrlToUpload (
		@RequestBody(required = false) String filepath){
		SuccessResponse response = SuccessResponse.builder()
			.status(HttpStatus.OK)
			.message("파일 업로드 url 발급에 성공했습니다.")
			.result(new String(s3UploaderService.getPreSignedUrl(filepath)))
			.build();
		return ResponseEntity.ok(response);
	}
}
