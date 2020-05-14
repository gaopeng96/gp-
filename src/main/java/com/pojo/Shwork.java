package com.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Shwork {
    private int hno;
    private String hname;
    private String hcontent;
    private String selectA;
    private String selectB;
    private String selectC;
    private String selectD;
    private String answer;
    private int tno;
    private int cno;
    @DateTimeFormat(pattern = "YYYY-MM-dd:HH:mm:ss")
    private Date htime;
    @DateTimeFormat(pattern = "YYYY-MM-dd:HH:mm")
    private Date endTime;
    private Class clas;

    public Shwork() {
    }

    public Shwork(int hno, String hname, String hcontent, String selectA, String selectB, String selectC, String selectD, String answer, int tno, int cno, Date htime, Date endTime, Class clas) {
        this.hno = hno;
        this.hname = hname;
        this.hcontent = hcontent;
        this.selectA = selectA;
        this.selectB = selectB;
        this.selectC = selectC;
        this.selectD = selectD;
        this.answer = answer;
        this.tno = tno;
        this.cno = cno;
        this.htime = htime;
        this.endTime = endTime;
        this.clas = clas;
    }

    public int getHno() {
        return hno;
    }

    public void setHno(int hno) {
        this.hno = hno;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getHcontent() {
        return hcontent;
    }

    public void setHcontent(String hcontent) {
        this.hcontent = hcontent;
    }

    public String getSelectA() {
        return selectA;
    }

    public void setSelectA(String selectA) {
        this.selectA = selectA;
    }

    public String getSelectB() {
        return selectB;
    }

    public void setSelectB(String selectB) {
        this.selectB = selectB;
    }

    public String getSelectC() {
        return selectC;
    }

    public void setSelectC(String selectC) {
        this.selectC = selectC;
    }

    public String getSelectD() {
        return selectD;
    }

    public void setSelectD(String selectD) {
        this.selectD = selectD;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getTno() {
        return tno;
    }

    public void setTno(int tno) {
        this.tno = tno;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public Date getHtime() {
        return htime;
    }

    public void setHtime(Date htime) {
        this.htime = htime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Class getClas() {
        return clas;
    }

    public void setClas(Class clas) {
        this.clas = clas;
    }
}
