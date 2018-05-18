package com.jk.dao;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.wyc.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IUserDaoTwo {

	long queryUserTotal(@Param("user") String username);

	List<User> queryUserPage(@Param("user") String username, @Param("s") int start, @Param("rows") int rows);

	void delUser(Integer userid);

	Object delUsers(@Param("ids") String ids);

	void addUser(User user);

	List<Map<String, Object>> getResourcesReList(User user);

	JSONObject queryUserListInfo();

	void delAll(@Param("ids") String[] ids);
}
