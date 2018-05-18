package com.jk.bean.ht;

public class Label {

    private Integer labelid;

    private String  labelname;

    private String labeladdress;

    public Integer getLabelid() {
        return labelid;
    }

    public void setLabelid(Integer labelid) {
        this.labelid = labelid;
    }

    public String getLabelname() {
        return labelname;
    }

    public void setLabelname(String labelname) {
        this.labelname = labelname;
    }

    public String getLabeladdress() {
        return labeladdress;
    }

    public void setLabeladdress(String labeladdress) {
        this.labeladdress = labeladdress;
    }

    @Override
    public String toString() {
        return "Label{" +
                "labelid=" + labelid +
                ", labelname='" + labelname + '\'' +
                ", labeladdress='" + labeladdress + '\'' +
                '}';
    }
}
