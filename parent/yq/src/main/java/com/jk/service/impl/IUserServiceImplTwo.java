package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.wyc.Role;
import com.jk.bean.wyc.User;
import com.jk.dao.IUserDaoTwo;
import com.jk.service.IUserServiceTwo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class IUserServiceImplTwo implements IUserServiceTwo {

	@Autowired
	private IUserDaoTwo userDao;

	public JSONObject queryUserPage(String username, int page, int rows) {
//		select * from 表名 limit 起始位置 ，每页条数
		int start =(page-1)*rows;//起始位置 = (当前页-1)*每页条数
		long counts = userDao.queryUserTotal(username);
		List<User> users = userDao.queryUserPage(username,start,rows);
		JSONObject json = new JSONObject();
//		总条数的key值必须叫total
		json.put("total", counts);
//		当前页展示数据的key值必须叫rows
		json.put("rows", users);
		return json;
	}

	public void delUser(Integer userid) {
		// TODO Auto-generated method stub
		userDao.delUser(userid);
	}

	public Object delUsers(String ids) {
		// TODO Auto-generated method stub
		return userDao.delUsers(ids);
	}

	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	public User getResourcesReList(User user) {
		//定义一个新的集合接受数据库查询到的数据
		Set<Role> roles=new HashSet<Role>();
		//查询数据库返回数据
		List<Map<String,Object>> listmap=userDao.getResourcesReList(user);
		//循环查询结果
		for (Map<String, Object> map : listmap) {
			Role re=new Role();
			re.setName(map.get("name").toString());
			re.setId(map.get("id").toString());
			roles.add(re);
		}
		user.setRoles(roles);

		return user;
	}

    public JSONObject queryUserListInfo() {
        return userDao.queryUserListInfo();
    }

	public void delAll(String[] ids) {
		userDao.delAll(ids);
	}


}
