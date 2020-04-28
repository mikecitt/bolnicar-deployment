package com.tim18.bolnicar.controller;

import com.tim18.bolnicar.model.ClinicCenterAdmin;
import com.tim18.bolnicar.service.impl.CCAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@CrossOrigin
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CCAdminServiceImpl ccAdminService;

    @PostMapping(
            path="/add",
            consumes = { MediaType.APPLICATION_JSON_VALUE },
            produces = { MediaType.APPLICATION_JSON_VALUE }
    )
    public ResponseEntity<HashMap<String, String>> addAdmin(@RequestBody ClinicCenterAdmin newAdmin) {
        HashMap<String, String> response = new HashMap<>();

        try {
            ccAdminService.save(newAdmin);
            response.put("message", "true");
        } catch (Exception ex) {
            response.put("message", "false");
        }

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
