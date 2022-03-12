package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Measurement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MeasurementRepository extends JpaRepository<Measurement, Long> {

    Optional<Measurement> findMeasurementById(Long id);

}
