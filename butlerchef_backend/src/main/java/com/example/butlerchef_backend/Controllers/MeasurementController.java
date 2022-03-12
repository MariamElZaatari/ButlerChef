package com.example.butlerchef_backend.Controllers;

import com.example.butlerchef_backend.Models.Measurement;
import com.example.butlerchef_backend.Services.MeasurementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/measurement")
public class MeasurementController {

    private final MeasurementService measurementService;

    @Autowired
    public MeasurementController(MeasurementService measurementService) {
        this.measurementService = measurementService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Map<String, Object>> measurementById(@PathVariable Long id){

        Measurement measurement = measurementService.getMeasurementAndQuantities(id);
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("measurement", measurement);
        return new ResponseEntity<>(map, HttpStatus.OK);

    }

    @GetMapping("/")
    public ResponseEntity<Map<String, Object>> measurements(){

        List<Measurement> measurement = measurementService.getMeasurements();
        Map<String, Object> map = new HashMap<>();
        map.put("status", 200);
        map.put("measurement", measurement);
        return new ResponseEntity<>(map, HttpStatus.OK);

    }

}
