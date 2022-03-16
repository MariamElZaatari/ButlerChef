package com.example.butlerchef_backend.Controllers;


import com.example.butlerchef_backend.Models.UserOrder;
import com.example.butlerchef_backend.Services.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@RestController
@Validated
@RequestMapping("/api/order")
public class UserOrderController {
    private final UserOrderService userOrderService;

    @Autowired
    public UserOrderController(UserOrderService userOrderService) {
        this.userOrderService = userOrderService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, Object>> createOrder(@Valid @RequestBody UserOrder userOrder){
        UserOrder new_order= userOrderService.create(userOrder);
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", 200);
        responseMap.put("message","Order created successfully");
        responseMap.put("data", new_order);
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> getOrderInfo(@PathVariable Long id){
        Collection<UserOrder> userOrderCollection = userOrderService.read(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("data", userOrderCollection);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PatchMapping("/update")
    public ResponseEntity<Map<String, Object>> updateOrderInfo(@Valid @RequestBody UserOrder userOrder){
        UserOrder new_userOrder = userOrderService.update(userOrder);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("Order updated successfully", new_userOrder);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteOrder(@PathVariable Long id){
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("message","Order deleted successfully");
        userOrderService.delete(id);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

}
