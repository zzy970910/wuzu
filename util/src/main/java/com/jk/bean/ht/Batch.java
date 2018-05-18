package com.jk.bean.ht;

public class Batch {

    private Integer id;
    private String bname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Batch{" +
                "id=" + id +
                ", bname='" + bname + '\'' +
                '}';
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }
}
