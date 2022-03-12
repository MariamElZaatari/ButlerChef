package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Exceptions.AuthenticateException;
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

    public User authenticateUser(User user) throws AuthenticateException  {

        Optional<User> u = userRepository.findUserByEmail(user.getEmail());

        if(!u.isPresent())
            throw new AuthenticateException("Email Not Found");

        if(!BCrypt.checkpw(user.getPassword(), u.get().getPassword()))
            throw new AuthenticateException("Wrong Password");

        return u.get();

    }

    public void createNewUser(User user) throws AuthenticateException {

        Pattern pattern = Pattern.compile("^(.+)@(.+)$");

        if(user.getEmail() != null)
            user.setEmail(user.getEmail().toLowerCase());

        assert user.getEmail() != null;
        if(!pattern.matcher(user.getEmail()).matches())
            throw new AuthenticateException("Invalid email format");

        Optional<User> u = userRepository.findUserByEmail(user.getEmail());
        if(u.isPresent())
            throw new AuthenticateException("Email Taken");

        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10));
        user.setPassword(hashedPassword);

        try{
            userRepository.save(user);
        }
        catch (Exception e){
            throw new AuthenticateException("Failed to Create User, Please Try Again");
        }


    }

}