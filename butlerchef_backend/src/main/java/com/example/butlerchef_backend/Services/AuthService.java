package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.regex.Pattern;

@Service
public class AuthService {

    private final UserRepository userRepository;

    @Autowired
    public AuthService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Optional<User> authenticateUser(User user) {

        Optional<User> u = userRepository.findUserByEmail(user.getEmail());

        if(!u.isPresent()){
            throw new IllegalStateException("Email Not Found");
        }

        if(!BCrypt.checkpw(user.getPassword(), u.get().getPassword()))
            throw new IllegalStateException("Wrong Password");

        return u;

    }

    public User createNewUser(User user) {

        Pattern pattern = Pattern.compile("^(.+)@(.+)$");

        if(user.getEmail() != null)
            user.setEmail(user.getEmail().toLowerCase());

        assert user.getEmail() != null;
        if(!pattern.matcher(user.getEmail()).matches())
            throw new IllegalStateException("Invalid email format");

        Optional<User> u = userRepository.findUserByEmail(user.getEmail());
        if(u.isPresent()){
            throw new IllegalStateException("Email Taken");
        }

        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10));
        user.setPassword(hashedPassword);

        return userRepository.save(user);

    }

}
