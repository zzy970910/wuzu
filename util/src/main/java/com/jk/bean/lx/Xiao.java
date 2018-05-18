package com.jk.bean.lx;

public class Xiao {
    private Integer id;
    private String name;
    private Integer daid;
    private String beizhu;
    private String dname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDaid() {
        return daid;
    }

    public void setDaid(Integer daid) {
        this.daid = daid;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    @Override
    public String toString() {
        return "Xiao{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", daid=" + daid +
                ", beizhu='" + beizhu + '\'' +
                ", dname='" + dname + '\'' +
                '}';
    }
}
