package com.jk.pojo;

import java.io.Serializable;


public class RoleTree {

    private Integer id;


    private Integer roleId;

    private Integer treeId;

    public Integer getRoleId() {
        return roleId;
    }
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
    public Integer getTreeId() {
        return treeId;
    }
    public void setTreeId(Integer treeId) {
        this.treeId = treeId;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "RoleTree [id=" + id + ", roleId=" + roleId + ", treeId=" + treeId + "]";
    }


}
