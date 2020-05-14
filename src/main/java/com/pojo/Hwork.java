package com.pojo;

import java.sql.Time;
import java.util.Date;

//用来查询学生所有作业

public class Hwork {
    private Integer hno;
    private Integer sno;
    private Integer cno;
    private Integer tno;
    private String tname;
    private String sname;
    private String hname;
    private String cname;
    private String hcontent;
    private String shcontent;
    private Integer grade;
    private Date htime;
    private String email;

    public Hwork() {

    }

    public Hwork(Integer hno, Integer sno, Integer cno, Integer tno,String tname, String sname, String hname, String cname, String hcontent, String shcontent, Integer grade, Date htime,String email) {
        this.hno = hno;
        this.sno = sno;
        this.cno = cno;
        this.tno = tno;
        this.tname = tname;
        this.sname = sname;
        this.hname = hname;
        this.cname = cname;
        this.hcontent = hcontent;
        this.shcontent = shcontent;
        this.grade = grade;
        this.htime = htime;
        this.email = email;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Date getHtime() {
        return htime;
    }

    public void setHtime(Date htime) {
        this.htime = htime;
    }

    public Integer getHno() {
        return hno;
    }

    public void setHno(Integer hno) {
        this.hno = hno;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
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

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getHcontent() {
        return hcontent;
    }

    public void setHcontent(String hcontent) {
        this.hcontent = hcontent;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
