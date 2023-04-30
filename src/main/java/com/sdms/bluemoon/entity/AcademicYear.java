package com.sdms.bluemoon.entity;

import javax.persistence.*;

@Entity
@Table(name = "academic_year")

public class AcademicYear {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "year", nullable = false, length = 15)
    private String year;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

}
