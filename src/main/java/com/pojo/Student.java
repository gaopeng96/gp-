package com.pojo;

public class Student {
    private Integer sno;
    private String spwd;
    private String sname;
    private String ssex;
    private Integer sage;
    private Integer cno;
    private Class clas;
    private String email;

    public Student() {
    }

    public Student(Integer sno, String spwd, String sname, String ssex, Integer sage, Integer cno, Class clas, String email) {
        this.sno = sno;
        this.spwd = spwd;
        this.sname = sname;
        this.ssex = ssex;
        this.sage = sage;
        this.cno = cno;
        this.clas = clas;
        this.email = email;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public Integer getSage() {
        return sage;
    }

    public void setSage(Integer sage) {
        this.sage = sage;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
