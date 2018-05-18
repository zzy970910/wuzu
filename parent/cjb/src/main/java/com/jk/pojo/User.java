package com.jk.pojo;

import java.io.Serializable;


public class User implements Serializable {


    private String userid;

    //真实姓名
    private String username;

    private Integer age;

    private String birday;

    private String userpwd;

    private String userflag;//出生日期

    private String loginname;//身份证号码

    private String telphone;

    @Override
    public String toString() {
        return "User{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", age=" + age +
                ", birday='" + birday + '\'' +
                ", userpwd='" + userpwd + '\'' +
                ", userflag='" + userflag + '\'' +
                ", loginname='" + loginname + '\'' +
                ", telphone='" + telphone + '\'' +
                '}';
    }

    public String getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public Integer getAge() {
        return age;
    }

    public String getBirday() {
        return birday;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public String getUserflag() {
        return userflag;
    }

    public String getLoginname() {
        return loginname;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public void setBirday(String birday) {
        this.birday = birday;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public void setUserflag(String userflag) {
        this.userflag = userflag;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }
}
