package com.jk.bean.lx;

public class Gou {
    private Indent id;
    private String  carid;
    private Integer goodscount;
    private String goodsname;
    private  Integer goodsid;
    private String goodsimage;
    private Double goodsprice;
    private Double goodsxiaoji;
    private Integer status;
    private Integer userid;

    public Indent getId() {
        return id;
    }

    public void setId(Indent id) {
        this.id = id;
    }

    public String getCarid() {
        return carid;
    }

    public void setCarid(String carid) {
        this.carid = carid;
    }

    public Integer getGoodscount() {
        return goodscount;
    }

    public void setGoodscount(Integer goodscount) {
        this.goodscount = goodscount;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsimage() {
        return goodsimage;
    }

    public void setGoodsimage(String goodsimage) {
        this.goodsimage = goodsimage;
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public Double getGoodsxiaoji() {
        return goodsxiaoji;
    }

    public void setGoodsxiaoji(Double goodsxiaoji) {
        this.goodsxiaoji = goodsxiaoji;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Gou{" +
                "id=" + id +
                ", carid='" + carid + '\'' +
                ", goodscount=" + goodscount +
                ", goodsname='" + goodsname + '\'' +
                ", goodsid=" + goodsid +
                ", goodsimage='" + goodsimage + '\'' +
                ", goodsprice=" + goodsprice +
                ", goodsxiaoji=" + goodsxiaoji +
                ", status=" + status +
                ", userid=" + userid +
                '}';
    }
}
