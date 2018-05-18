package com.jk.pojo;


import java.io.Serializable;


public class Role implements Serializable {


    private Integer roleid;

    private String rolenum;

    private String rolename;

    private Integer valid;

    private String description;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolenum() {
        return rolenum;
    }

    public void setRolenum(String rolenum) {
        this.rolenum = rolenum;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public Integer getValid() {
        return valid;
    }

    public void setValid(Integer valid) {
        this.valid = valid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Role [roleid=" + roleid + ", rolenum=" + rolenum + ", rolename=" + rolename + ", valid=" + valid
                + ", description=" + description + "]";
    }



}
