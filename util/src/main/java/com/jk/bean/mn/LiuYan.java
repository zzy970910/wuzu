package com.jk.bean.mn;

public class LiuYan {

    private Integer id;
    private Integer uid;
    private String  name;
    private String  lycontent;
    private String  lytime;
    private String  hfcontent;
    private String  hftime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLycontent() {
        return lycontent;
    }

    public void setLycontent(String lycontent) {
        this.lycontent = lycontent;
    }

    public String getLytime() {
        return lytime;
    }

    public void setLytime(String lytime) {
        this.lytime = lytime;
    }

    public String getHfcontent() {
        return hfcontent;
    }

    public void setHfcontent(String hfcontent) {
        this.hfcontent = hfcontent;
    }

    public String getHftime() {
        return hftime;
    }

    public void setHftime(String hftime) {
        this.hftime = hftime;
    }

    @Override
    public String toString() {
        return "LiuYan{" +
                "id=" + id +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", lycontent='" + lycontent + '\'' +
                ", lytime='" + lytime + '\'' +
                ", hfcontent='" + hfcontent + '\'' +
                ", hftime='" + hftime + '\'' +
                '}';
    }
}
