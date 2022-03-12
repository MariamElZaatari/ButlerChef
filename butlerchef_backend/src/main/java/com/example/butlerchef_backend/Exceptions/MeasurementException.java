package com.example.butlerchef_backend.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class MeasurementException extends RuntimeException {

    public MeasurementException(String message) {
        super(message);
    }
}
