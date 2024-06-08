package com.example.recipeswebsite.Model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class Announcement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(columnDefinition = "MEDIUMTEXT")
    private String announcement;

    private LocalDateTime timeWritten;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    public LocalDateTime getTimeWritten() {
        return timeWritten;
    }

    public void setTimeWritten(LocalDateTime timeWritten) {
        this.timeWritten = timeWritten;
    }
}
