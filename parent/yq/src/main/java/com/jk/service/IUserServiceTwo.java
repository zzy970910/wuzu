package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.wyc.User;

public interface IUserServiceTwo {

	JSONObject queryUserPage(String username, int page, int rows);

	void delUser(Integer userid);

	Object delUsers(String ids);

	void addUser(User user);

	User getResourcesReList(User user);

    JSONObject queryUserListInfo();

     void delAll(String[] ids);
}
