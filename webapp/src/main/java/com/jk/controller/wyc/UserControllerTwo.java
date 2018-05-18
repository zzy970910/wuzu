package com.jk.controller.wyc;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.wyc.ExportExcelMax;
import com.jk.bean.wyc.User;
import com.jk.service.IUserServiceTwo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("userController")
public class UserControllerTwo {

	@Autowired
	private IUserServiceTwo userService;
	//新增用户跳转
	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return "/WEB-INF/wyc/addUserForm";
	}
	//查询用户跳转
	@RequestMapping(value="/queryUser")
	public String queryUser(){
		return "/WEB-INF/wyc/userListTwo";
	}
	//分页查询用户
	@RequestMapping("queryUserPage")
	@ResponseBody
	public Object queryUserPage(String username,int page,int rows){
		JSONObject json = userService.queryUserPage(username,page,rows);
		return json;
	}
	// 删除
	@RequestMapping(value="/delUser")
	@ResponseBody
	public String delUser(Integer userid){
		userService.delUser(userid);
		return "delSuccess";
	}
	//批量删除
	@RequestMapping(value="/delUsers")
	@ResponseBody
	public Object delUsers(String ids){
	/*	String success = (String) userService.delUsers(ids);*/
	    userService.delUsers(ids);
		return "success";
	}

	//新增用户
	@RequestMapping(value="/addUser")
	@ResponseBody
	public String addUser(User user){
		userService.addUser(user);
		return "addSuccess";
	}
	// POI 查询
	@RequestMapping(value="/queryUserListInfo")
	@ResponseBody
	public Object queryUserListInfo(){
		JSONObject json = userService.queryUserListInfo();
		return json;
	}

	//批量删除delAll
	@RequestMapping(value="/delAll")
	@ResponseBody
	public String delAll(@RequestParam("ids[]")  String ids[]){
		userService.delAll(ids);
		return "success";
	}


}
