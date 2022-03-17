package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.*;
import com.example.butlerchef_backend.Repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Optional;

@Service
public class FridgeProductService {
    private final FridgeProductRepository fridgeProductRepository;
    private final UserRepository userRepository;
    private final MeasurementRepository measurementRepository;
    private final QuantityRepository quantityRepository;

    @Autowired
    public FridgeProductService(FridgeProductRepository fridgeProductRepository, UserRepository userRepository, MeasurementRepository measurementRepository, QuantityRepository quantityRepository) {
        this.fridgeProductRepository = fridgeProductRepository;
        this.userRepository = userRepository;
        this.measurementRepository = measurementRepository;
        this.quantityRepository=quantityRepository;
    }

    public Collection<FridgeProduct> readByUser(long id){
        return fridgeProductRepository.findByUserIdOrderByCreatedAtDesc(id);
    }
    public Collection<FridgeProduct> readByUserAndName(Long id, String name){
        return fridgeProductRepository.findByUserIdAndNameLikeIgnoreCaseOrderByNameAsc(id,"%"+name+"%");
    }

    public FridgeProduct create(FridgeProduct fridgeProduct) {
        User user=userRepository.findById(fridgeProduct.getUser().getId()).get();
        Measurement measurement=measurementRepository.findMeasurementById(fridgeProduct.getMeasurement().getId()).get();
        Quantity quantity=quantityRepository.findById(fridgeProduct.getQuantity().getId()).get();
        fridgeProduct.setUser(user);
        fridgeProduct.setMeasurement(measurement);
        fridgeProduct.setQuantity(quantity);
        fridgeProduct.setCreatedAt();
        return fridgeProductRepository.save(fridgeProduct);
    }

    public FridgeProduct update(FridgeProduct fridgeProduct){
        FridgeProduct oldFridgeProduct=fridgeProductRepository.findById(fridgeProduct.getId()).get();
        Measurement measurement=measurementRepository.findMeasurementById(fridgeProduct.getMeasurement().getId()).get();
        Quantity quantity=quantityRepository.findById(fridgeProduct.getQuantity().getId()).get();
        oldFridgeProduct.setMeasurement(measurement);
        oldFridgeProduct.setQuantity(quantity);
        oldFridgeProduct.setName(fridgeProduct.getName());
        oldFridgeProduct.setUpdatedAt();
        return fridgeProductRepository.save(oldFridgeProduct);
    }
    public void delete(Long id){
        fridgeProductRepository.deleteById(id);
    }
}
