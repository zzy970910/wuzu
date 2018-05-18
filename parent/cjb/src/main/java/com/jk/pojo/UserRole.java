package com.jk.pojo;



import java.io.Serializable;


public class UserRole implements Serializable {


    private Integer id;
    private String userId;
    private Integer roleId;

    public UserRole(){

    }

    public UserRole(String userId,Integer roleId){
        this.userId=userId;
        this.roleId=roleId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getuserId() {
        return this.userId;
    }

    public void setuserId(String userId) {
        this.userId = userId;
    }

    public Integer getroleId() {
        return this.roleId;
    }

    public void setroleId(Integer roleId) {
        this.roleId = roleId;
    }



}
