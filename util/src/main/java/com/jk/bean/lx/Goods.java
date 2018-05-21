package com.jk.bean.lx;

import java.util.Date;

public class Goods {
    private Integer id;
    private String sname;
    private Double price;
    private Integer kucun;
    private Integer xiaoid;
    private Integer daid;
    private Integer rid;
    private Integer tid;
    private String name;
    private Integer count;
    private Double xiaoji;
    private String pasttime;
    private Integer pcid;
    private Double zhekou;
    private Double zhehouprice;
    private String image;
    private String dname;
    private Integer mid;




    private Date begintime;//=========

    private Date endtime;//=========

    private Integer mcount;//===========

    private Double mprice;//===========

    private String namess;//===========

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getKucun() {
        return kucun;
    }

    public void setKucun(Integer kucun) {
        this.kucun = kucun;
    }

    public Integer getXiaoid() {
        return xiaoid;
    }

    public void setXiaoid(Integer xiaoid) {
        this.xiaoid = xiaoid;
    }

    public Integer getDaid() {
        return daid;
    }

    public void setDaid(Integer daid) {
        this.daid = daid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getXiaoji() {
        return xiaoji;
    }

    public void setXiaoji(Double xiaoji) {
        this.xiaoji = xiaoji;
    }

    public String getPasttime() {
        return pasttime;
    }

    public void setPasttime(String pasttime) {
        this.pasttime = pasttime;
    }

    public Integer getPcid() {
        return pcid;
    }

    public void setPcid(Integer pcid) {
        this.pcid = pcid;
    }

    public Double getZhekou() {
        return zhekou;
    }

    public void setZhekou(Double zhekou) {
        this.zhekou = zhekou;
    }

    public Double getZhehouprice() {
        return zhehouprice;
    }

    public void setZhehouprice(Double zhehouprice) {
        this.zhehouprice = zhehouprice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getMcount() {
        return mcount;
    }

    public void setMcount(Integer mcount) {
        this.mcount = mcount;
    }

    public Double getMprice() {
        return mprice;
    }

    public void setMprice(Double mprice) {
        this.mprice = mprice;
    }

    public String getNamess() {
        return namess;
    }

    public void setNamess(String namess) {
        this.namess = namess;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", sname='" + sname + '\'' +
                ", price=" + price +
                ", kucun=" + kucun +
                ", xiaoid=" + xiaoid +
                ", daid=" + daid +
                ", rid=" + rid +
                ", tid=" + tid +
                ", name='" + name + '\'' +
                ", count=" + count +
                ", xiaoji=" + xiaoji +
                ", pasttime='" + pasttime + '\'' +
                ", pcid=" + pcid +
                ", zhekou=" + zhekou +
                ", zhehouprice=" + zhehouprice +
                ", image='" + image + '\'' +
                ", dname='" + dname + '\'' +
                ", mid=" + mid +
                ", begintime='" + begintime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", mcount=" + mcount +
                ", mprice=" + mprice +
                ", namess='" + namess + '\'' +
                '}';
    }
}
