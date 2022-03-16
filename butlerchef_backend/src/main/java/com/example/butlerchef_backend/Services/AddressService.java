package com.example.butlerchef_backend.Services;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.CookedRecipe;
import com.example.butlerchef_backend.Models.Recipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Repositories.AddressRepository;
import com.example.butlerchef_backend.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Service
public class AddressService {
    private final AddressRepository addressRepository;
    private final UserRepository userRepository;

    @Autowired
    public AddressService(AddressRepository addressRepository, UserRepository userRepository) {
        this.addressRepository = addressRepository;
        this.userRepository = userRepository;
    }

    public Collection<Address> read(long id){
        return addressRepository.findByUserIdOrderByTitleAsc(id);
    }

    public Address create(Address address) {
        Optional<User> temp_user=userRepository.findById(address.getUser().getId());
        User user=temp_user.get();
        address.setUser(user);
        address.setCreatedAt();
        return addressRepository.save(address);
    }

    public Address update(Address address){
        Address oldAddress=addressRepository.findById(address.getId()).get();
        oldAddress.setTitle(address.getTitle());
        oldAddress.setCity(address.getCity());
        oldAddress.setStreet(address.getStreet());
        oldAddress.setPhone(address.getPhone());
        oldAddress.setUpdatedAt();
        return addressRepository.save(oldAddress);
    }
    public void delete(Long id){
        addressRepository.deleteById(id);
    }
}
