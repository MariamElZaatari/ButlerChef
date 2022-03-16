package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.UserOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface UserOrderRepository extends JpaRepository<UserOrder, Long> {
    Collection<UserOrder> findByUserIdOrderByCreatedAtDesc(Long id);
}
