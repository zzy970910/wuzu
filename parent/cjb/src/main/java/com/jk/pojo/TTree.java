package com.jk.pojo;


import java.io.Serializable;


public class TTree implements Serializable {

    private Integer id;
    private String text;
    private String url;
    private Integer pid;
    private Integer nid;

    private Boolean checked=false;


    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public TTree() {
    }

    public TTree(String text, String url, Integer pid, Integer nid) {
        this.text = text;
        this.url = url;
        this.pid = pid;
        this.nid = nid;
    }


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
    }


    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getPid() {
        return this.pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getNid() {
        return this.nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    @Override
    public String toString() {
        return "TTree [id=" + id + ", text=" + text + ", url=" + url + ", pid=" + pid + ", nid=" + nid + ", checked="
                + checked + "]";
    }



}
