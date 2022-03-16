package com.example.butlerchef_backend.Repositories;

import com.example.butlerchef_backend.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

    @Query("SELECT u FROM User u WHERE u.email = ?1")
    Optional<User> findUserByEmail(String email);
    @Query("SELECT id, firstName, lastName, imageUrl FROM User u WHERE u.id = ?1")
    List<Object[]> findUserById(Long id);
    Collection<User> findUsersByFirstNameLikeIgnoreCaseOrLastNameLikeIgnoreCase(String firstName, String lastName);





}
