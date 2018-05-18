package com.jk.bean.lx;

public class Miao {
    private Integer id;
    private Integer goodid;
    private Integer count;
    private String begintime;
    private String endtime;
    private Double  mprice;
    private String mimage;

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

    public String getBegintime() {
        return begintime;
    }

    public void setBegintime(String begintime) {
        this.begintime = begintime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public Double getMprice() {
        return mprice;
    }

    public void setMprice(Double mprice) {
        this.mprice = mprice;
    }

    public String getMimage() {
        return mimage;
    }

    public void setMimage(String mimage) {
        this.mimage = mimage;
    }

    @Override
    public String toString() {
        return "Miao{" +
                "id=" + id +
                ", goodid=" + goodid +
                ", count=" + count +
                ", begintime='" + begintime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", mprice=" + mprice +
                ", mimage='" + mimage + '\'' +
                '}';
    }
}
