package com.sdms.bluemoon.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "fee_txn")
@Data
public class FeeTxn {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private StudentYear studentYear;

    @Column(name = "school_fee", nullable = false, length = 15)
    private Long schoolFee;

    @Column(name = "book_fee", nullable = false, length = 15)
    private Long bookFee;

    @Column(name = "uniform_fee", nullable = false, length = 15)
    private Long uniformFee;

    @Column(name = "van_fee", nullable = false, length = 15)
    private Long vanFee;

    @Column(name = "amount_paid", nullable = false, length = 15)
    private Long amountPaid;

    @Column(name = "payment_date", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP", nullable = false)
    private Timestamp paymentDate;

    @Column(name = "remarks", length = 1000)
    private String remarks;
}
