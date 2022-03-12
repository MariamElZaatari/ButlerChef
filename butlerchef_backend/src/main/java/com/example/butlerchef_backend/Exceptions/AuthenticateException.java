package com.example.butlerchef_backend.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class AuthenticateException extends RuntimeException {

    public AuthenticateException(String message) {
        super(message);
    }
}