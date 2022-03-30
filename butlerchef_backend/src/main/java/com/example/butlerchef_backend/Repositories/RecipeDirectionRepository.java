package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.RecipeDirection;
import com.example.butlerchef_backend.Models.RecipeProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface RecipeDirectionRepository extends JpaRepository<RecipeDirection, Long> {
    Collection<RecipeDirection> findByRecipeId(Long id);

    @Modifying
    @Query( value = "insert into recipe_direction (id, recipe_id, title," +
            " content, created_at, updated_at) " +
            "values (null, :recipe_id, :title, :content, :created_at, :updated_at)",
            nativeQuery = true)
    void addDirection(@Param("recipe_id") Long recipe_id,
                      @Param("title") String title,
                      @Param("content") String content,
                      @Param("created_at") String created_at,
                      @Param("updated_at") String updated_at);
}
