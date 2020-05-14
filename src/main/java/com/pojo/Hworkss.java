package com.pojo;

import java.util.Date;

public class Hworkss {
    private Integer sno;
    private Integer hno;
    private Integer cno;
    private Integer tno;
    private String hname;
    private String tname;
    private String hcontent;
    private String shcontent;
    private String selectA;
    private String selectB;
    private String selectC;
    private String selectD;
    private String answer;
    private Integer grade;
    private Date htime;
    private Date endTime;

    public Hworkss() {
    }

    public Hworkss(Integer sno, Integer hno, Integer cno, Integer tno, String hname, String tname, String hcontent,String shcontent, String selectA, String selectB, String selectC, String selectD, String answer,Integer grade, Date htime, Date endTime) {
        this.sno = sno;
        this.hno = hno;
        this.cno = cno;
        this.tno = tno;
        this.hname = hname;
        this.tname = tname;
        this.hcontent = hcontent;
        this.shcontent = shcontent;
        this.selectA = selectA;
        this.selectB = selectB;
        this.selectC = selectC;
        this.selectD = selectD;
        this.answer = answer;
        this.grade = grade;
        this.htime = htime;
        this.endTime = endTime;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public Integer getHno() {
        return hno;
    }

    public void setHno(Integer hno) {
        this.hno = hno;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getTno() {
        return tno;
    }

    public void setTno(Integer tno) {
        this.tno = tno;
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

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getShcontent() {
        return shcontent;
    }

    public void setShcontent(String shcontent) {
        this.shcontent = shcontent;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}
