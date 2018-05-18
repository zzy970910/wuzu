package com.jk.bean.lx;



public class Da {
    private  Integer id;
    private String dname;
    private String beizhu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    @Override
    public String toString() {
        return "Da{" +
                "id=" + id +
                ", dname='" + dname + '\'' +
                ", beizhu='" + beizhu + '\'' +
                '}';
    }
}
