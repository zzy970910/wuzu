package com.jk.pojo;

import java.io.Serializable;




public class Indent implements Serializable{


    private Integer id;

    private String userid;

    private String createtime;

    private Double allprice;

    private Integer status;

    private Integer goodscount;

    private String gouwucheid;

    private String username;

    private String indentcode;



    public String getIndentcode() {
        return indentcode;
    }
    public void setIndentcode(String indentcode) {
        this.indentcode = indentcode;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getCreatetime() {
        return createtime;
    }
    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
    public Double getAllprice() {
        return allprice;
    }
    public void setAllprice(Double allprice) {
        this.allprice = allprice;
    }
    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Integer getGoodscount() {
        return goodscount;
    }
    public void setGoodscount(Integer goodscount) {
        this.goodscount = goodscount;
    }
    public String getGouwucheid() {
        return gouwucheid;
    }
    public void setGouwucheid(String gouwucheid) {
        this.gouwucheid = gouwucheid;
    }

    @Override
    public String toString() {
        return "Indent [id=" + id + ", userid=" + userid + ", createtime=" + createtime + ", allprice=" + allprice
                + ", status=" + status + ", goodscount=" + goodscount + ", gouwucheid=" + gouwucheid + ", username="
                + username + ", indentcode=" + indentcode + "]";
    }


}
