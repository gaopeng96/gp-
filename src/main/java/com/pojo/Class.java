package com.pojo;

public class Class {
    private Integer cno;
    private String cname;
    private Integer account;

    public Class() {
    }

    public Class(Integer cno, String cname,Integer account) {
        this.cno = cno;
        this.cname = cname;
        this.account = account;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getAccount() {
        return account;
    }

    public void setAccount(Integer account) {
        this.account = account;
    }
}
