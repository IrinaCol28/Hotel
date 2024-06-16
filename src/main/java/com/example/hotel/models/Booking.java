package com.example.hotel.models;
import javax.persistence.*;
import java.sql.Date;

/**
 * Класс бронирований.
 */
@Entity
@Table(name = "booking")

public class Booking {
    /** Поле айди */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    /** Поле даты начала */
    private Date dataStart;

    /** Поле даты окончания */
    private Date dataEnd;

    /** Поле стоимости */
    private double cost;

    /** Поле статуса */
    private int status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDataStart() {
        return dataStart;
    }

    public void setDataStart(Date dataStart) {
        this.dataStart = dataStart;
    }

    public Date getDataEnd() {
        return dataEnd;
    }


    public void setDataEnd(Date dataEnd) {
        this.dataEnd = dataEnd;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /** Поле пользователя */
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private User user;


    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    /** Поле номера */
    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    private Room room;

}
