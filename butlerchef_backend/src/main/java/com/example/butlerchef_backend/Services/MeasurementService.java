package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Exceptions.MeasurementException;
import com.example.butlerchef_backend.Models.Measurement;
import com.example.butlerchef_backend.Repositories.MeasurementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MeasurementService {
    private final MeasurementRepository measurementRepository;

    @Autowired
    public MeasurementService(MeasurementRepository measurementRepository) {
        this.measurementRepository = measurementRepository;
    }

    public Measurement getMeasurementAndQuantities(Long id) throws MeasurementException {

        Optional<Measurement> measurement = measurementRepository.findMeasurementById(id);

        if(!measurement.isPresent())
            throw new MeasurementException("Measurement Not Found");

        return measurement.get();

    }

    public List<Measurement> getMeasurements() throws MeasurementException {

        return measurementRepository.findAll();

    }

}
