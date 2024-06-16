package com.example.hotel.models;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
/**
 * Класс номера.
 */
@Entity
@Table(name = "rooms")

public class Room {
    /** Поле айди */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    /** Поле описания */
    @Column(name = "description", columnDefinition = "text")
    private String description;

    /** Поле цены*/
    @Column(name = "price")
    private int price;

    /** Поле номера комнаты */
    @Column(name = "number")
    private String number;

    /** Поле вместительности */
    @Column(name = "place")
    private int place;

    /** Поле изображений */
    //image
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
    mappedBy = "room")
    private List<Image> images = new ArrayList<>();

    /** Поле превью */
    private Long previewImageId;
    //user

    /** Поле пользователя */
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    /** Поле бонирований */
    @OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER,
            mappedBy = "room")
    private List<Booking> booking = new ArrayList<>();

    /**
     * Функция добавления изображений
     * @param image - изображение
     */
    public void addImageToRoom(Image image) {
        image.setRoom(this);
        images.add(image);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Long getPreviewImageId() {
        return previewImageId;
    }

    public void setPreviewImageId(Long previewImageId) {
        this.previewImageId = previewImageId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getDateOfCreated() {
        return dateOfCreated;
    }

    public void setDateOfCreated(LocalDateTime dateOfCreated) {
        this.dateOfCreated = dateOfCreated;
    }

    public List<Booking> getBooking() {
        return booking;
    }

    public void setBooking(List<Booking> booking) {
        this.booking = booking;
    }
}
