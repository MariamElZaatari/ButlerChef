package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.FridgeProduct;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.ShopProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface FridgeProductRepository extends JpaRepository<FridgeProduct, Long> {
    Collection<FridgeProduct> findByUserIdOrderByCreatedAtDesc(Long id);
    Collection<FridgeProduct> findByUserIdAndNameLikeIgnoreCaseOrderByNameAsc(Long id, String name);
}
