package com.sdms.bluemoon.entity;

import javax.persistence.*;

@Entity
@Table(name = "paid_fee")
public class PaidFee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "school_fee", nullable = false, length = 15)
    private Long schoolFee;

    @Column(name = "book_fee", nullable = false, length = 15)
    private Long bookFee;

    @Column(name = "uniform_fee", nullable = false, length = 15)
    private Long uniformFee;

    @Column(name = "van_fee", nullable = false, length = 15)
    private Long vanFee;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSchoolFee() {
        return schoolFee;
    }

    public void setSchoolFee(Long schoolFee) {
        this.schoolFee = schoolFee;
    }

    public Long getBookFee() {
        return bookFee;
    }

    public void setBookFee(Long bookFee) {
        this.bookFee = bookFee;
    }

    public Long getUniformFee() {
        return uniformFee;
    }

    public void setUniformFee(Long uniformFee) {
        this.uniformFee = uniformFee;
    }

    public Long getVanFee() {
        return vanFee;
    }

    public void setVanFee(Long vanFee) {
        this.vanFee = vanFee;
    }


}
