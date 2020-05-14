package com.pojo;

import java.util.Date;

public class Thwork {
    private Integer hno;
    private Integer tno;
    private Integer cno;
    private String hname;
    private String hcontent;
    private Date htime;
    private Class clas;

    public Thwork() {
    }

    public Thwork(Integer hno, Integer tno, Integer cno, String hname, String hcontent, Date htime,Class clas) {
        this.hno = hno;
        this.tno = tno;
        this.cno = cno;
        this.hname = hname;
        this.hcontent = hcontent;
        this.htime = htime;
        this.clas=clas;
    }

    public Integer getHno() {
        return hno;
    }

    public void setHno(Integer hno) {
        this.hno = hno;
    }

    public Integer getTno() {
        return tno;
    }

    public void setTno(Integer tno) {
        this.tno = tno;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
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

    public Date getHtime() {
        return htime;
    }

    public void setHtime(Date htime) {
        this.htime = htime;
    }

    public Class getClas() {
        return clas;
    }

    public void setClas(Class clas) {
        this.clas = clas;
    }
}
