package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.RecipeProduct;
import com.example.butlerchef_backend.Models.ShopProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface ShopProductRepository extends JpaRepository<ShopProduct, Long> {
    Collection<ShopProduct> findByStockNot(int stock);
    Collection<ShopProduct> findByNameLikeIgnoreCaseOrderByNameAsc(String name);
}
