package com.becareful.backend.common.model.dto;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class SuccessResponse {

	HttpStatus status;
	String message;
	Object result;

	public SuccessResponse(HttpStatus status, String message) {
		this.status = status;
		this.message = message;
	}
}
