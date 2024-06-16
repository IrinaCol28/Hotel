package com.example.hotel.repositories;
import com.example.hotel.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room, Long> {
    List<Room> findByPlace(int place);
    List<Room> findByPrice(double price);

    List<Room> findByPlaceAndPrice(int place, double price);


}
