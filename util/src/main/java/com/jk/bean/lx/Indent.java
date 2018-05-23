package com.jk.bean.lx;

public class Indent {
    private Integer id;
    private String indentcode;
    private Double allprice;
    private String createtime;
    private Integer goodsid;
    private Integer userid;
    private String username;
    private String goodscount;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIndentcode() {
        return indentcode;
    }

    public void setIndentcode(String indentcode) {
        this.indentcode = indentcode;
    }

    public Double getAllprice() {
        return allprice;
    }

    public void setAllprice(Double allprice) {
        this.allprice = allprice;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGoodscount() {
        return goodscount;
    }

    public void setGoodscount(String goodscount) {
        this.goodscount = goodscount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Indent{" +
                "id=" + id +
                ", indentcode='" + indentcode + '\'' +
                ", allprice=" + allprice +
                ", createtime='" + createtime + '\'' +
                ", goodsid=" + goodsid +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", goodscount='" + goodscount + '\'' +
                ", status=" + status +
                '}';
    }
}
