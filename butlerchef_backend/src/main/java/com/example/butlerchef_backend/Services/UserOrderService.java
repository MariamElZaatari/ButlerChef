package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Models.UserOrder;
import com.example.butlerchef_backend.Repositories.UserOrderRepository;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Optional;

@Service
public class UserOrderService {
    private final UserOrderRepository userOrderRepository;
    private final UserRepository userRepository;

    @Autowired
    public UserOrderService(UserOrderRepository userOrderRepository, UserRepository userRepository) {
        this.userOrderRepository = userOrderRepository;
        this.userRepository = userRepository;
    }

    public Collection<UserOrder> read(long id){
        return userOrderRepository.findByUserIdOrderByCreatedAtDesc(id);
    }

    public UserOrder create(UserOrder userOrder) {
        Optional<User> temp_user=userRepository.findById(userOrder.getUser().getId());
        User user=temp_user.get();
        userOrder.setUser(user);
        userOrder.setCreatedAt();
        return userOrderRepository.save(userOrder);
    }

    public UserOrder update(UserOrder userOrder){
        UserOrder oldOrder=userOrderRepository.findById(userOrder.getId()).get();
        oldOrder.setTotal(userOrder.getTotal());
        oldOrder.setStatus(userOrder.getStatus());
        oldOrder.setUpdatedAt();
        return userOrderRepository.save(oldOrder);
    }

    public void delete(Long id){
        userOrderRepository.deleteById(id);
    }
}
