package com.tim18.bolnicar.controller;

import com.tim18.bolnicar.dto.ResponseReport;
import com.tim18.bolnicar.dto.UserDTO;
import com.tim18.bolnicar.model.MedicalReport;
import com.tim18.bolnicar.service.PatientService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@CrossOrigin
@RequestMapping("/patient")
public class PatientController {
    @Autowired
    private PatientService patientService;

    @PostMapping(path = "/register", consumes = "application/json")
    public ResponseEntity<ResponseReport> register(@RequestBody UserDTO user) {
        //TODO: exception
        boolean flag = patientService.registerPatient(user);

        if (flag) {
            return new ResponseEntity<>(
                    new ResponseReport("ok", "Your registration request is successfully created."),
                    HttpStatus.OK);
        }

        return new ResponseEntity<>(
                new ResponseReport("error", "Invalid input."),
                HttpStatus.BAD_REQUEST);
    }

    //TODO: get patient id from session token
    @GetMapping(path = "/medicalRecord/{id}", consumes = "application/json")
    public ResponseEntity<Set<MedicalReport>> getMedicalReport(@PathVariable Integer id) {
        return new ResponseEntity<>(this.patientService.getMedicalRecord(id), HttpStatus.OK);
    }
}
