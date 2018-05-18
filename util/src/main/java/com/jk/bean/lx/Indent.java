package com.jk.bean.lx;

public class Indent {
    private Integer id;
    private String incode;
    private String price;
    private String createtime;
    private Integer userid;
    private String username;
    private Integer stauts;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIncode() {
        return incode;
    }

    public void setIncode(String incode) {
        this.incode = incode;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
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

    public Integer getStauts() {
        return stauts;
    }

    public void setStauts(Integer stauts) {
        this.stauts = stauts;
    }

    @Override
    public String toString() {
        return "Indent{" +
                "id=" + id +
                ", incode='" + incode + '\'' +
                ", price='" + price + '\'' +
                ", createtime='" + createtime + '\'' +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", stauts=" + stauts +
                '}';
    }
}
