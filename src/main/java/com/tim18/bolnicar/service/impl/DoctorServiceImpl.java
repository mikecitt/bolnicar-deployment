package com.tim18.bolnicar.service.impl;

import com.tim18.bolnicar.model.Doctor;
import com.tim18.bolnicar.repository.DoctorRepository;
import com.tim18.bolnicar.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean register(Doctor doctor) {
        doctor.setPassword(passwordEncoder.encode(doctor.getPassword()));
        doctor.setActive(true);

        try {
            save(doctor);
            return true;
        } catch (Exception ex) {
        }

        return false;
    }

    @Override
    public List<Doctor> findAll() {
        return (List<Doctor>) doctorRepository.findAll();
    }

    @Override
    public Doctor findOne(int id) {
        return doctorRepository.findById(id).orElseGet(null);
    }

    @Override
    public Doctor findOne(String emailAddress) {
        return doctorRepository.findByEmailAddress(emailAddress);
    }

    @Override
    public Doctor save(Doctor doctor) {
        return doctorRepository.save(doctor);
    }

    @Override
    public void remove(int id) {
        doctorRepository.deleteById(id);
    }
}
