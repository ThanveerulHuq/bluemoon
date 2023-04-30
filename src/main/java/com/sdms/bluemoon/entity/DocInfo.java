package com.sdms.bluemoon.entity;

import javax.persistence.*;

@Entity
@Table(name = "doc_info")
public class DocInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "doc_id")
    private Long docId;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private StudentsInfo studentsInfo;


    @Column(name = "file_name", nullable = false, length = 40)
    private String fileName;

    @Lob
    @Column(name = "s_file")
    private byte[] sFile;

    public Long getDocId() {
        return docId;
    }

    public void setDocId(Long docId) {
        this.docId = docId;
    }

    public StudentsInfo getStudentsInfo() {
        return studentsInfo;
    }

    public void setStudentsInfo(StudentsInfo studentsInfo) {
        this.studentsInfo = studentsInfo;
    }


    public byte[] getsFile() {
        return sFile;
    }

    public void setsFile(byte[] sFile) {
        this.sFile = sFile;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

}
