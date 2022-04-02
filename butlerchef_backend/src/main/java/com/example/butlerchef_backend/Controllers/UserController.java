package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Services.AuthService;
import com.example.butlerchef_backend.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Validated
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getUserInfo(@PathVariable Long id){
        List<Object[]> u = userService.read(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("user", u);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateUserInfo(@Valid @RequestBody User user){
        User u = userService.update(user);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message", "user updated successfully");
        map.put("data", u);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update/name/{id}/{name}")
    public User updateUserName(@PathVariable Long id,@PathVariable String name){
        return userService.updateName(id,name);
    }

    @GetMapping("/search/{name}")
    public ResponseEntity<Map<String, Object>> searchUsersByName(@PathVariable String name){
        Collection<User> userCollectionByFirstName = userService.getByName(name);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("Users", userCollectionByFirstName);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


}
