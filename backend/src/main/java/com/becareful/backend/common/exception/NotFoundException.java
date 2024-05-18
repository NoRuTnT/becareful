package com.becareful.backend.common.exception;


import org.springframework.http.HttpStatus;

public class NotFoundException extends BusinessException {

	public NotFoundException(final String message) {
		super(message);
	}

	@Override
	public HttpStatus status() {
		return HttpStatus.NOT_FOUND;
	}
}