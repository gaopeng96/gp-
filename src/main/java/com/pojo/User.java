package com.pojo;

public class User {
    private Integer uid;
    private Integer pwd;

    public User() {
    }

    public User(Integer uid, Integer pwd) {
        this.uid = uid;
        this.pwd = pwd;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPwd() {
        return pwd;
    }

    public void setPwd(Integer pwd) {
        this.pwd = pwd;
    }
}
