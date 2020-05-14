package com.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Notice {
    private Integer nno;
    private String ncontent;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date ntime;

    public Notice() {
    }

    public Notice(Integer nno, String ncontent, Date ntime) {
        this.nno = nno;
        this.ncontent = ncontent;
        this.ntime = ntime;
    }

    public Integer getNno() {
        return nno;
    }

    public void setNno(Integer nno) {
        this.nno = nno;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public Date getNtime() {
        return ntime;
    }

    public void setNtime(Date ntime) {
        this.ntime = ntime;
    }
}
