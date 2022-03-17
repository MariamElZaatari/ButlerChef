package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.*;
import com.example.butlerchef_backend.Repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class ShopProductService {
    private final ShopProductRepository shopProductRepository;
    private final MeasurementRepository measurementRepository;
    private final QuantityRepository quantityRepository;

    @Autowired
    public ShopProductService(ShopProductRepository shopProductRepository, MeasurementRepository measurementRepository, QuantityRepository quantityRepository) {
        this.shopProductRepository = shopProductRepository;
        this.measurementRepository = measurementRepository;
        this.quantityRepository=quantityRepository;
    }

    public Collection<ShopProduct> read(){
        return shopProductRepository.findByStockNot(0);
    }

    public Collection<ShopProduct> readRecipesByName(String name){
        return shopProductRepository.findByNameLikeIgnoreCaseOrderByNameAsc("%"+name+"%");
    }

    public ShopProduct create(ShopProduct shopProduct) {
        Measurement measurement=measurementRepository.findMeasurementById(shopProduct.getMeasurement().getId()).get();
        Quantity quantity=quantityRepository.findById(shopProduct.getQuantity().getId()).get();
        shopProduct.setMeasurement(measurement);
        shopProduct.setQuantity(quantity);
        shopProduct.setCreatedAt();
        return shopProductRepository.save(shopProduct);
    }

    public ShopProduct update(ShopProduct shopProduct){
        ShopProduct oldShopProduct=shopProductRepository.findById(shopProduct.getId()).get();
        Measurement measurement=measurementRepository.findMeasurementById(shopProduct.getMeasurement().getId()).get();
        Quantity quantity=quantityRepository.findById(shopProduct.getQuantity().getId()).get();
        oldShopProduct.setMeasurement(measurement);
        oldShopProduct.setQuantity(quantity);
        oldShopProduct.setName(shopProduct.getName());
        oldShopProduct.setPrice(shopProduct.getPrice());
        oldShopProduct.setStock(shopProduct.getStock());
        oldShopProduct.setImageUrl(shopProduct.getImageUrl());
        oldShopProduct.setUpdatedAt();
        return shopProductRepository.save(oldShopProduct);
    }
    public void delete(Long id){
        shopProductRepository.deleteById(id);
    }
}
