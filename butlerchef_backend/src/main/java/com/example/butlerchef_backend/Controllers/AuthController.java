package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public Optional<User> login(@RequestBody User user){
        return authService.authenticateUser(user);
    }

    @PostMapping("/register")
    public User register(@RequestBody User user){
        return authService.createNewUser(user);
    }

}
