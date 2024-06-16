package com.example.hotel.controllers;

import com.example.hotel.models.Booking;
import com.example.hotel.services.*;
import com.example.hotel.services.BookingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Controller
@RequiredArgsConstructor

public class BookingController {
    private final BookingService bookingService;
    private final RoomService roomService;


    @GetMapping("/bookings")
    public String Bookings(Model model) {
        bookingService.closedListBooking(bookingService.listBooking());
        model.addAttribute("bookings", bookingService.listBooking());
        model.addAttribute("user", bookingService.getUserByPrincipal());
        System.out.println(bookingService.getUserByPrincipal().getEmail());
        return "bookings";
    }

    @GetMapping("/booking/{id}")
    public String BookingInfo(@PathVariable Long id, Model model) {
        Booking booking = bookingService.getBookingById(id);
        model.addAttribute("booking", booking);
        model.addAttribute("room", booking.getRoom());
        model.addAttribute("images", booking.getRoom().getImages());
        return "booking-info";
    }

    @GetMapping("/booking/create/{id}")
    public String createGetBooking(@PathVariable Long id, Model model) throws IOException {
        model.addAttribute("room", roomService.getRoomById(id));
        model.addAttribute("bookedDays", bookingService.displayBookedDays(roomService.getRoomById(id).getBooking()));
        //дата сегодня и завтра
        LocalDate date = LocalDate.now();
        LocalDate date2 = date.plus(1, ChronoUnit.DAYS);
        model.addAttribute("localDate", date);
        model.addAttribute("localDate2", date2);
        return "book";
    }

    @PostMapping("/booking/create/{id}")
    public String createBooking(@PathVariable Long id,@RequestParam("dataStart") Date dataStart, @RequestParam("dataEnd") Date dataEnd, Booking booking) throws IOException {
        if(roomService.сheckIfDateFree(dataStart,dataEnd, id))
        {
            bookingService.createBooking(booking, dataStart, dataEnd, roomService.getRoomById(id));
            return "bookings";
        }
        return "book";

    }

    @GetMapping("/booking/cancel/{id}")
    public String deleteGetBooking(@PathVariable Long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("user", bookingService.getUserByPrincipal());
        return "alert-booking-delete";
    }

    @PostMapping("/booking/cancel/{id}")
    public String cancelBooking(@PathVariable Long id) {
       bookingService.cancelBooking(id);
        //bookingService.deleteBooking(id);
        return "redirect:/bookings";
    }

    @PostMapping("/booking/delete/{id}")
    public String deleteBooking(@PathVariable Long id) {
        bookingService.deleteBooking(id);
        return "redirect:/bookings";
    }
}
