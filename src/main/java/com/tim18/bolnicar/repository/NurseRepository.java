package com.tim18.bolnicar.repository;

import com.tim18.bolnicar.model.Nurse;
import org.springframework.data.repository.CrudRepository;

public interface NurseRepository extends CrudRepository<Nurse, Integer> {
}