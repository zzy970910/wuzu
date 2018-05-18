package com.jk.controller.wyc;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.wyc.Role;
import com.jk.bean.wyc.Tree;
import com.jk.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	//  查询角色跳转页面
	@RequestMapping("queryRole")
	public  String queryD(){
		return "/WEB-INF/wyc/roleList";
	}

	//  查询角色跳转页面
	@RequestMapping("queryaddrolemenu")
	public  String queryaddrolemenu(){
		return "/WEB-INF/wyc/addrolemenu";
	}
	// 查询角色分页
	@RequestMapping("/roleList")
	@ResponseBody
	public JSONObject roleList(int page, int rows, Role role,String name){
		JSONObject list=(JSONObject) roleService.roleList(page,rows,role,name);
		return list;
	}
	// 付角色
	@ResponseBody
	@RequestMapping("/addchamenulist")
	public List<Tree> addchamenulist(Integer roid){
		List<Tree>   list1= 	roleService.addcharolemenulist(roid);
		  List<Tree>   list2=   roleService.addchamenulist();
		  /*System.out.println(list2);
		  System.out.println(list1);*/
		   for (Tree menu : list2) {
			  for (Tree menu1 : list1) {
				if (menu.getId()==menu1.getId()) {
					menu.setChecked(true);
				}
			}
		}
			return list2;
	}
	//修改
	@ResponseBody
	@RequestMapping("/updaterolemenulist")
	public String  updaterolemenulist(String  ids,Integer roid){
		roleService.roleService(roid);
		String[] arr = 	ids.split(",");
		for (int i = 0; i < arr.length; i++) {
			roleService.saverolemenulist(Integer.parseInt(arr[i]),roid);
		}
		return "true";
	}
	
	
}
