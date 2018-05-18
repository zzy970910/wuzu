package com.jk.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.wyc.Role;
import com.jk.bean.wyc.Tree;



public interface RoleService {

	JSONObject roleList(int page, int rows, Role role,String name);

	List<Tree> addcharolemenulist(Integer roid);

	List addchamenulist();

	void roleService(Integer roid);

	void saverolemenulist(int parseInt, Integer roid);



}
