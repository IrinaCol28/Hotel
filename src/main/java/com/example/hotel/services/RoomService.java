package com.example.hotel.services;

import com.example.hotel.models.*;
import com.example.hotel.models.Room;
import com.example.hotel.repositories.RoomRepository;
import com.example.hotel.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.Console;
import java.io.IOException;
import java.security.Principal;
import java.sql.Date;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;

/**
 * Класс для работы с номерами гостиницы.
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class RoomService {

    /** Репозиторий номеров */
    private final RoomRepository roomRepository;

    /** Репозиторий пользователей */
    private final UserRepository userRepository;

    /**
     * Функция поиска свободных номеров по дате
     * @return возвращает список свободных номеров
     * @param dateFrom - дата начала брони
     * @param dateBefore - дата окончания брони
     */

    public List<Room> findByFreeForADate(Date dateFrom, Date dateBefore) {
        List<Room> rooms = new ArrayList<>();


        for (Room room : roomRepository.findAll()) {
            boolean isRoomFree = true;
            if (room.getBooking().isEmpty())
            {
                rooms.add(room);
            }
            else
            {
                for (Booking booking : room.getBooking()) {
                    // Проверяем, перекрывается ли бронирование с выбранным промежутком дат
                    if(booking.getStatus()!=0&&booking.getStatus()!=2) {

                        if (!checkIntervalWithinInterval(booking.getDataStart(), booking.getDataEnd(), dateFrom, dateBefore)) {
                            isRoomFree = false;
                            break;
                        }
                    }
                }
            }

            if (isRoomFree) {
                rooms.add(room);
            }
        }

        return rooms;
    }




    /**
     * Функция определения свободна ли дата
     * @return возвращает истину если занята, или ложь если свободна
     * @param dateFrom - дата начала брони
     * @param dateBefore - дата окончания брони
     * @param id - айди номера
     */
    public boolean сheckIfDateFree(Date dateFrom,Date dateBefore, Long id) {
        Room room=getRoomById(id);
        for (Room rooms :findByFreeForADate(dateFrom,dateBefore))
        {
//            if(room.equals(rooms))
//            {
//                return true;
//            }
            if(Objects.equals(room.getId(), rooms.getId()))
            {
                return true;
            }
        }
        return false;
    }

//    /**
//     * Функция проверки совпадения даты
//     * @return возвращает ложь если совпадает, или истину если не совпадает
//     * @param dateFrom - дата начала брони
//     * @param dateBefore - дата окончания брони
//     * @param booking - бронирование
//     */
//    public boolean сheckIfDateCopy(Date dateFrom,Date dateBefore, Booking booking) {
//System.out.println(booking.getDataStart());
//        System.out.println(booking.getDataEnd());
//        System.out.println(dateFrom);
//        System.out.println(dateBefore);
//            if(checkIntervalWithinInterval(booking.getDataStart(),booking.getDataEnd(),dateFrom,dateBefore))
//            {
//                return false;
//            }
//        return true;
//    }


    public boolean checkIntervalWithinInterval(Date interval1Start, Date interval1End, Date interval2Start, Date interval2End) {
        // Проверка, что interval1Start находится после или равен interval2Start
        // и interval1End находится перед или равен interval2End
        if (interval1Start.compareTo(interval2Start) >= 0 && interval1End.compareTo(interval2End) <= 0) {
            return false;
        }
        // Проверка, что interval1Start находится перед interval2End
        // и interval1End находится после interval2Start
        else if (interval1Start.compareTo(interval2End) < 0 && interval1End.compareTo(interval2Start) > 0) {
            return false;
        }
        // Промежутки времени не перекрываются
        else {
            return true;
        }
    }





    /**
     * Функция поиска номеров по вместимости
     * @return возвращает список номеров
     * @param place - вместимость
     * @param roomHashSet - список номеров
     */
    public List<Room> findByPlace(String place,List<Room> roomHashSet) {
        List<Room> room=new ArrayList<>();
        for(Room rooms: roomHashSet)
        {
            if(rooms.getPlace()==Integer.parseInt(place))
            {
                room.add(rooms);
            }
        }
        return room;
    }

    /**
     * Функция поиска номеров по цене
     * @return возвращает список номеров
     * @param priceBefore - цена наибольшая
     * @param priceFrom - стартовая цена
     * @param roomHashSet - список номеров
     */
    public List<Room> findByPrice(String priceFrom, String priceBefore, List<Room> roomHashSet) {
        double priceOne=Double.parseDouble(priceFrom);
        double priceTwo=Double.parseDouble(priceBefore);
        List<Room> room=new ArrayList<>();
        for(Room rooms: roomHashSet)
        {
            if(rooms.getPrice()>=priceOne&&rooms.getPrice()<=priceTwo)
            {
                room.add(rooms);
            }
        }
        return room;
    }

    /**
     * Функция получения  всех номеров
     * @return возвращает список номеров
     */
    public HashSet<Room> listRoomSet( ) {
        HashSet<Room> room=new HashSet<Room>();
        for(Room rooms: roomRepository.findAll())
        {
                room.add(rooms);
        }
        return room;
    }

    public List<Room> listRoom( ) {
        return roomRepository.findAll();
    }

    /**
     * Функция получения  всех забронированных номеров для администратора
     * @return возвращает список забронированных номеров
     */
    public List<Room> listRoomForAdmin( ) {
        List<Room> rooms=new ArrayList<>();
        for(Room room:roomRepository.findAll())
        {
            if(!room.getBooking().isEmpty()&&listRoomForAdminCountActiveBooking(room)!=0)
            {
                rooms.add(room);
            }
        }
       return rooms;
    }

    /**
     * Функция получения  всех свободных номеров для администратора
     * @return возвращает список свободных номеров
     */
    public List<Room> listFreeRoomForAdmin( ) {
        List<Room> rooms=new ArrayList<>();
        for(Room room:roomRepository.findAll())
        {
            if(room.getBooking().isEmpty()||listRoomForAdminCountActiveBooking(room)==0)
            {
                rooms.add(room);
            }
        }
        return rooms;
    }

    /**
     * Функция получения количества броней для номера
     * @return возвращает количество  броней для номера
     * @param room - номер
     */
    public Integer listRoomForAdminCountActiveBooking(Room room ) {
        List<Room> rooms=new ArrayList<>();
        int count=0;
        for(Booking booking:room.getBooking())
        {
            if(booking.getStatus()==1)
            {
                count++;
            }
        }
        return count;
    }



    /**
     * Функция добавления номера
     * @param room - номер
     * @param file1 - первое изображение, идёт на превью
     * @param file2 - второе изображение
     * @param file3 - третье изображение
     * @param principal - параметр пользователя
     */
    public void saveRoom(Principal principal, Room room, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        room.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            room.addImageToRoom(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            room.addImageToRoom(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            room.addImageToRoom(image3);
        }
        log.info("Saving new Room. Описание: {}; Author email: {}", room.getDescription(), room.getUser().getEmail());
        Room roomFromDb = roomRepository.save(room);
        roomFromDb.setPreviewImageId(roomFromDb.getImages().get(0).getId());
        roomRepository.save(room);
    }

    /**
     * Функция определения пользователя
     * @param principal - параметр пользователя
     * @return возвращает текущего пользователя
     */
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    /**
     * Функция для выбора изображения
     * @param file - текущее изображение
     * @return возвращает обьект изображения
     */
    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    /**
     * Функция редактирования номера
     * @param id- айди номера
     * @param principal - параметр пользователя
     * @param description - описание
     * @param price - цена
     * @param place - вместительность
     * @param number - номер комнаты
     * @return возвращает изененный номер
     */
    public Room redactionRoom(Principal principal,Long id, String description, String price, String place, String number) throws IOException {
        Room room=roomRepository.getById(id);
        room.setUser(getUserByPrincipal(principal));
        room.setDescription(description);
        room.setPrice(Integer.parseInt(price));
        room.setPlace(Integer.parseInt(place));
        room.setNumber(number);
        Room room1=editRoom(room);
        return  room1;
    }

    /**
     * Функция удаления номера
     * @param id- айди номера
     */
    public void deleteRoom(Long id) {
        roomRepository.deleteById(id);
    }

    /**
     * Функция сохранения номера
     * @param room- номер
     * @return возвращает измененный номер
     */
    public Room editRoom(Room room) {
        return roomRepository.save(room);
    }

    /**
     * Функция поиска номера
     * @param id- айди номера
     * @return возвращает номер
     */
    public Room getRoomById(Long id) {
        return roomRepository.findById(id).orElse(null);
    }
}
