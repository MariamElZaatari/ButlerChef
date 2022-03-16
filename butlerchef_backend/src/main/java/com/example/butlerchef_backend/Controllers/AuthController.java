package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Constants;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Services.AuthService;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@Validated
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    @Autowired
    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@Valid @RequestBody User user){
        User u = authService.authenticateUser(user);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("user", u);
        map.put("token", generateJWTToken(u));
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String, Object>> register(@Valid @RequestBody User user){
        authService.createNewUser(user);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message", "User Created Successfully");
        return new ResponseEntity<>(map, HttpStatus.OK);

    }

    private String generateJWTToken(User user) {
        long timestamp = System.currentTimeMillis();
        return Jwts.builder().signWith(SignatureAlgorithm.HS256, Constants.API_SECRET_KEY)
                .setIssuedAt(new Date(timestamp))
                .setExpiration(new Date(timestamp + Constants.TOKEN_VALIDITY))
                .claim("userId", user.getId())
                .claim("email", user.getEmail())
                .claim("firstName", user.getFirstName())
                .claim("lastName", user.getLastName())
                .compact();
    }

}
