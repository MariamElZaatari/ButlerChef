package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.RecipeProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface RecipeProductRepository extends JpaRepository<RecipeProduct, Long> {
    Collection<RecipeProduct> findByRecipeId(Long id);


    @Modifying
    @Query( value = "insert into recipe_product (id, recipe_id, quantity_id," +
            " measurement_id, name, created_at, updated_at) " +
            "values (null, :recipe_id, :quantity_id, :measurement_id, :name, :created_at, :updated_at)",
            nativeQuery = true)
    void addProduct(@Param("recipe_id") Long recipe_id,
                    @Param("quantity_id") Long quantity_id,
                    @Param("measurement_id") Long measurement_id,
                    @Param("name") String name,
                    @Param("created_at") String created_at,
                    @Param("updated_at") String updated_at);
}
