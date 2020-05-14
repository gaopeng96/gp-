package com.pojo;

public class Admin {
    private Integer ano;
    private String apwd;

    public Admin() {

    }

    public Admin(Integer ano, String apwd) {
        this.ano = ano;
        this.apwd = apwd;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd;
    }
}
