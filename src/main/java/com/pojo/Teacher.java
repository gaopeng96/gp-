package com.pojo;

public class Teacher {
    private Integer tno;
    private String tpwd;
    private String tname;
    private String tsex;
    private Integer tage;
    private Integer cno;
    private Class clas;

    public Teacher() {

    }

    public Teacher(Integer tno, String tpwd, String tname, String tsex, Integer tage, Integer cno,Class clas) {
        this.tno = tno;
        this.tpwd = tpwd;
        this.tname = tname;
        this.tsex = tsex;
        this.tage = tage;
        this.cno = cno;
        this.clas = clas;
    }

    public Integer getTno() {
        return tno;
    }

    public void setTno(Integer tno) {
        this.tno = tno;
    }

    public String getTpwd() {
        return tpwd;
    }

    public void setTpwd(String tpwd) {
        this.tpwd = tpwd;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public Integer getTage() {
        return tage;
    }

    public void setTage(Integer tage) {
        this.tage = tage;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Class getClas() {
        return clas;
    }

    public void setClas(Class clas) {
        this.clas = clas;
    }

}
