package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Address;
import com.example.butlerchef_backend.Models.FavoriteRecipe;
import com.example.butlerchef_backend.Models.User;
import com.example.butlerchef_backend.Services.AddressService;
import com.example.butlerchef_backend.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Validated
@RequestMapping("/api/address")
public class AddressController {
    private final AddressService addressService;

    @Autowired
    public AddressController(AddressService addressService) {
        this.addressService = addressService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createAddress(@Valid @RequestBody Address address){
        Address new_address=addressService.create(address);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Address created successfully");
        responseMap.put("data", new_address);

        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getAddressInfo(@PathVariable Long id){
        Collection<Address> addressCollection = addressService.read(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", addressCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateAddressInfo(@Valid @RequestBody Address address){
        Address new_address = addressService.update(address);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("address updated successfully", new_address);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }


    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteAddress(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Address deleted successfully");
        addressService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}
