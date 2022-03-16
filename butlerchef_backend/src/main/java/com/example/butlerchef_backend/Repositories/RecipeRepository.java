package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    Collection<Recipe> findByNameLikeIgnoreCaseOrderByNameAsc(String name);
    Collection<Recipe> findByUserIdAndNameLikeIgnoreCaseOrderByNameAsc(Long id, String name);
    Collection<Recipe> findByUserIdOrderByCreatedAtDesc(Long id);
}
