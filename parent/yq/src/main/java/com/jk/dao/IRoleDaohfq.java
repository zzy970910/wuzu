package com.jk.dao;

import com.jk.bean.wyc.Role;

import java.util.List;
import java.util.Map;

public interface IRoleDaohfq {
    int deleteByPrimaryKey(String id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> roles();

    void deleteUserRoleReation(String userId);

    void addRoleUserRelation(List<Map<String, Object>> map);


}