package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.UserRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final UserRepositoryImpl userRepository;

    @Autowired
    public AuthService(UserRepositoryImpl userRepository) {
        this.userRepository = userRepository;
    }

    public Integer Register(User user){
        return userRepository.create(user);
    }

}
