package com.jk.service;

import com.jk.bean.wyc.Role;

import java.util.List;


public interface RoleServicehfq {

	List<Role> roles();

	void addRoleUserRelation(String roleId, String userId);

}
