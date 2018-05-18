package com.jk.pojo;

import java.io.Serializable;


public class ZxlHouTaiDenglu {


    private Integer id;

    private String houtailonginname;//登录名

    private String houtailonginpwd;//密码


    private String shoujihao;//手机号
    private String ycode;//手机号



    public String getYcode() {

        return ycode;
    }
    public void setYcode(String ycode) {

        this.ycode = ycode;
    }
    public Integer getId() {

        return id;
    }
    public void setId(Integer id) {

        this.id = id;
    }
    public String getHoutailonginname() {
        return houtailonginname;
    }
    public void setHoutailonginname(String houtailonginname) {

        this.houtailonginname = houtailonginname;
    }
    public String getHoutailonginpwd() {

        return houtailonginpwd;
    }
    public void setHoutailonginpwd(String houtailonginpwd) {

        this.houtailonginpwd = houtailonginpwd;
    }
    public String getShoujihao() {

        return shoujihao;
    }
    public void setShoujihao(String shoujihao) {

        this.shoujihao = shoujihao;
    }

    @Override
    public String toString() {
        return "HouTaiDenglu [id=" + id + ", houtailonginname=" + houtailonginname + ", houtailonginpwd="
                + houtailonginpwd + ", shoujihao=" + shoujihao + ", ycode=" + ycode + "]";
    }



}
