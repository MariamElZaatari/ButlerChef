package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {


    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<Object[]> read(long id){
        return userRepository.findUserById(id);
    }

    public User update(User user){
        User oldUser=userRepository.findById(user.getId()).get();
        oldUser.setFirstName(user.getFirstName());
        oldUser.setLastName(user.getLastName());
        oldUser.setImageUrl(user.getImageUrl());
        oldUser.setUpdated_at();
        return userRepository.save(oldUser);
    }

    public User updateName(Long id, String name){
        User oldUser=userRepository.findById(id).get();
        String[] newName=name.split("_");
        oldUser.setFirstName(newName[0]);
        oldUser.setLastName(newName[1]);
        oldUser.setUpdated_at();
        return userRepository.save(oldUser);
    }

    public User updateImage(Long id, String image){
        User oldUser=userRepository.findById(id).get();
        oldUser.setImageUrl(image);
        oldUser.setUpdated_at();
        return userRepository.save(oldUser);
    }

    public void delete(Long id){
        userRepository.deleteById(id);
    }
    public Collection<User> getByName(String name){
        return userRepository.findUsersByFirstNameLikeIgnoreCaseOrLastNameLikeIgnoreCase("%"+name+"%", "%"+name+"%");

    }
}
