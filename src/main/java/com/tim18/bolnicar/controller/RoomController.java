package com.tim18.bolnicar.controller;

import com.tim18.bolnicar.dto.ResponseReport;
import com.tim18.bolnicar.dto.RoomDTO;
import com.tim18.bolnicar.model.Clinic;
import com.tim18.bolnicar.model.ClinicAdmin;
import com.tim18.bolnicar.model.Room;
import com.tim18.bolnicar.service.ClinicAdminService;
import com.tim18.bolnicar.service.ClinicService;
import com.tim18.bolnicar.service.impl.RoomServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomServiceImpl roomService;

    @Autowired
    private ClinicAdminService clinicAdminService;

    @Autowired
    private ClinicService clinicService;

    @GetMapping(path = "/")
    @PreAuthorize("hasRole('CLINIC_ADMIN')")
    public ResponseEntity<List<RoomDTO>> getRooms(Principal user) {
        ClinicAdmin clinicAdmin = clinicAdminService.findSingle(user.getName());
        List<RoomDTO> roomDTOList = new ArrayList<>();
        if(clinicAdmin != null && clinicAdmin.getClinic() != null)
            for(Room room : clinicAdmin.getClinic().getRooms()) {
                roomDTOList.add(new RoomDTO(room));
            }

        return new ResponseEntity<>(roomDTOList, HttpStatus.OK);
    }

    @PostMapping(
            path = "/add",
            consumes = { MediaType.APPLICATION_JSON_VALUE },
            produces = { MediaType.APPLICATION_JSON_VALUE }
    )
    @PreAuthorize("hasRole('CLINIC_ADMIN')")
    public ResponseEntity<Map<String, String>> addRoom(@RequestBody Room newRoom, Principal user) {
        HashMap<String, String> response = new HashMap<>();
        ClinicAdmin clinicAdmin = clinicAdminService.findSingle(user.getName());
        if(clinicAdmin != null && clinicAdmin.getClinic() != null) {
            newRoom.setClinic(clinicAdmin.getClinic());
            try {
                roomService.save(newRoom);
                response.put("message", "true");
            } catch (Exception ex) {
                response.put("message", "false");
                System.out.println(ex);
            }
        }
        else {
            response.put("message", "false");
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @DeleteMapping("/{roomNumber}")
    @PreAuthorize("hasRole('CLINIC_ADMIN')")
    public  ResponseEntity<Void> deleteRoom(@PathVariable int roomNumber, Principal user) {
        Room room = roomService.findByRoomNumber(roomNumber);
        ClinicAdmin clinicAdmin = clinicAdminService.findSingle(user.getName());
        if(room != null && clinicAdmin != null && clinicAdmin.getClinic() != null
                && clinicAdmin.getClinic().getRooms().contains(room)) {
            roomService.remove(room.getId());
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/{roomNumber}")
    @PreAuthorize("hasRole('CLINIC_ADMIN')")
    public ResponseEntity<RoomDTO> getRoom(@PathVariable int roomNumber, Principal user) {
        ClinicAdmin clinicAdmin = clinicAdminService.findSingle(user.getName());
        Room room = roomService.findByRoomNumber(roomNumber);
        if(clinicAdmin.getClinic().getRooms().contains(room))
            return new ResponseEntity<>(new RoomDTO(room), HttpStatus.OK);
        else
            return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @PutMapping
    @PreAuthorize("hasRole('CLINIC_ADMIN')")
    public ResponseEntity<ResponseReport> updateRoom(@RequestBody Room roomUpdates, Principal user) {
        ClinicAdmin clinicAdmin = clinicAdminService.findSingle(user.getName());
        ResponseReport report = new ResponseReport("error", "Forbidden action, contact admin.");
        Room room = this.roomService.findOne(roomUpdates.getId());
        if(room != null && clinicAdmin != null && clinicAdmin.getClinic() != null && clinicAdmin.getClinic().getRooms().contains(room)) {
            roomUpdates.setClinic(room.getClinic());
            if(this.roomService.save(roomUpdates) != null) {
                report.setStatus("ok");
                report.setMessage("Profile successfully updated.");
                return ResponseEntity.ok(report);
            }
            else {
                report.setMessage(null);

                return new ResponseEntity<>(report, HttpStatus.BAD_REQUEST);
            }
        }
        else {
            report.setMessage(null);

            return new ResponseEntity<>(report, HttpStatus.BAD_REQUEST);
        }


    }
}
