package com.example.hotel.controllers;

import com.example.hotel.models.Room;
import com.example.hotel.services.BookingService;
import com.example.hotel.services.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class RoomController {
    private final RoomService roomService;
    private final BookingService bookingService;

    @GetMapping("/search")
    public String searchFormRooms(Model model) {
        //дата сегодня и завтра
        LocalDate date = LocalDate.now();
        System.out.println(date);
        LocalDate date2 = date.plus(1, ChronoUnit.DAYS);
        System.out.println(date2);
        model.addAttribute("localDate", date);
        model.addAttribute("localDate2", date2);
        return "search";
    }

    @PostMapping("/search")
    public String searchRooms(@RequestParam(name = "place") String place, @RequestParam(name = "priceFrom") String priceFrom,
                              @RequestParam(name = "priceBefore") String priceBefore,@RequestParam(name = "dateFrom") Date dateFrom,
                              @RequestParam(name = "dateBefore") Date dateBefore, Principal principal, Model model) {
        List<Room> room=roomService.findByFreeForADate(dateFrom, dateBefore);
        room=roomService.findByPlace(place, room);
        room=roomService.findByPrice(priceFrom, priceBefore, room);
        model.addAttribute("rooms", room);
        model.addAttribute("user", roomService.getUserByPrincipal(principal));
        return "search-result";
    }


    @GetMapping("/")
    public String rooms(Principal principal, Model model) {
        model.addAttribute("rooms", roomService.listRoomSet());
        model.addAttribute("user", roomService.getUserByPrincipal(principal));
        return "rooms";
    }

    @GetMapping("/room/{id}")
    public String roomInfo(@PathVariable Long id, Model model) {
        Room room = roomService.getRoomById(id);
        model.addAttribute("room", room);
        model.addAttribute("images", room.getImages());
        return "room-info";
    }

    @GetMapping("/room/create")
    public String roomCreate(Principal principal, Model model) {
        model.addAttribute("rooms", roomService.listRoomSet());
        model.addAttribute("user", roomService.getUserByPrincipal(principal));
        return "rooms-create";
    }

    @PostMapping("/room/create")
    public String createRoom(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Room room, Principal principal) throws IOException {
        roomService.saveRoom(principal, room, file1, file2, file3);
        return "redirect:/";
    }

    @GetMapping("/room/delete/{id}")
    public String deleteGetRoom(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        return "room-delete";
    }

    @PostMapping("/room/booking/delete/{id}")
    public String deleteRoomBooking(@PathVariable Long id, Model model) {
bookingService.deleteListBooking(roomService.getRoomById(id).getBooking());
        model.addAttribute("id", id);
        return "room-delete";
    }

    @PostMapping("/room/delete/{id}")
    public String deleteRoom(@PathVariable Long id) {
        //bookingService.deleteListBooking(roomService.getRoomById(id).getBooking());
        roomService.deleteRoom(id);
        return "redirect:/";
    }


    @GetMapping("/room/cancel/delete/{id}")
    public String deleteCancelRoomGet(@PathVariable Long id, Model model) {
            model.addAttribute("boolean", roomService.getRoomById(id).getBooking().isEmpty());
        return "room-cancel-booking";
    }


    @PostMapping("/room/cancel/delete/{id}")
    public String deleteCancelRoom(@PathVariable Long id) {
            bookingService.cancelListBooking(roomService.getRoomById(id).getBooking());
        return "redirect:/";
    }

    @GetMapping("/room/redaction/{id}")
    public String redactionGetRoom(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        return "room-redaction";
    }

    @PostMapping("/room/redaction/{id}")
    public String redactionRoom(@PathVariable Long id, Principal principal,   @RequestParam("description") String description,
                                @RequestParam("price") String price, @RequestParam("place") String place,
                                @RequestParam("number") String number) throws IOException {
        roomService.redactionRoom(principal,id, description, price, place, number);
        return "redirect:/";
    }


    @GetMapping("/bookingRooms")
    public String bookingFormRooms(Model model,Principal principal) {
        model.addAttribute("rooms", roomService.listRoomForAdmin());
        model.addAttribute("user", roomService.getUserByPrincipal(principal));
        return "booking-rooms-for-admin";
    }

    @GetMapping("/freeRooms")
    public String FreeFormRooms(Model model,Principal principal) {
        model.addAttribute("rooms", roomService.listFreeRoomForAdmin());
        model.addAttribute("user", roomService.getUserByPrincipal(principal));
        return "free-rooms-from-admin";
    }
}
