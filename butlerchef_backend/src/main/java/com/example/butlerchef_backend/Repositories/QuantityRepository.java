package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Measurement;
import com.example.butlerchef_backend.Models.Quantity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuantityRepository extends JpaRepository<Quantity, Long> {

}
