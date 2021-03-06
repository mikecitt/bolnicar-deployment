package com.tim18.bolnicar.service;

import com.tim18.bolnicar.dto.AppointmentDTO;
import com.tim18.bolnicar.dto.AppointmentRequestDTO;
import com.tim18.bolnicar.dto.GradeRequest;
import com.tim18.bolnicar.model.Appointment;
import com.tim18.bolnicar.model.Clinic;
import com.tim18.bolnicar.model.Doctor;
import com.tim18.bolnicar.model.Room;
import com.tim18.bolnicar.model.RoomType;

import java.util.List;

public interface AppointmentService {
    boolean bookAppointment(Integer appointmentId, Integer patientId);
    boolean bookAppointment(Integer appointmentId, String patientEmail);
    List<Appointment> findDoctorsAppointments(Doctor doctor);
    List<Appointment> findAllDoctorsAppointments(Doctor doctor);
    List<Appointment> findRoomsAppointments(Room room);
    List<AppointmentDTO> getFreeAppointments(Integer clinicId);
    Appointment addAppointmentRequest(AppointmentRequestDTO appointment, String patientEmail);
    boolean addAppointment(Appointment appointment);
    List<AppointmentDTO> findAllAppointmentRequests(Clinic clinic);
    Appointment findById(int id);
    Appointment save(Appointment appointment);
    void remove(int id);
    boolean gradeAppointment(String patientEmail, GradeRequest req);
    String appointmentInfo(Appointment appointment);
    List<Appointment> findAll();
}
