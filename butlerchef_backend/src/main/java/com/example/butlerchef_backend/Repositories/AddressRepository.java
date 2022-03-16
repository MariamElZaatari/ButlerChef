package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.CookedRecipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {


    Collection<Address> findByUserIdOrderByTitleAsc(Long id);

}
