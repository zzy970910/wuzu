package com.jk.bean.lx;

import org.joda.time.DateTime;

import java.util.Date;

public class Miao {
    private Integer id;
    private Integer goodid;
    private Integer count;
    private Date begintime;
    private Date endtime;
    private String begintimeStr;
    private String endtimeStr;
    private Double  mprice;
    private String goodimage;
    //0未生效 1生效中 2
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
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

    public String getBegintimeStr() {
        return begintimeStr;
    }

    public void setBegintimeStr(String begintimeStr) {
        this.begintimeStr = begintimeStr;
    }

    public String getEndtimeStr() {
        return endtimeStr;
    }

    public void setEndtimeStr(String endtimeStr) {
        this.endtimeStr = endtimeStr;
    }

    public Double getMprice() {
        return mprice;
    }

    public void setMprice(Double mprice) {
        this.mprice = mprice;
    }

    public String getGoodimage() {
        return goodimage;
    }

    public void setGoodimage(String goodimage) {
        this.goodimage = goodimage;
    }

    @Override
    public String toString() {
        return "Miao{" +
                "id=" + id +
                ", goodid=" + goodid +
                ", count=" + count +
                ", begintime=" + begintime +
                ", endtime=" + endtime +
                ", mprice=" + mprice +
                ", goodimage='" + goodimage + '\'' +
                '}';
    }
}
