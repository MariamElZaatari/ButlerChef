package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository {
//    UpdateUser() - {}
//    getUserById() - {}
//    getUsersByName(name) - {user[]}

    Integer create(User user);

}
