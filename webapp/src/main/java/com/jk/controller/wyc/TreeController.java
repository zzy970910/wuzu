package com.jk.controller.wyc;

import com.jk.bean.wyc.Tree;
import com.jk.service.ITreeService;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/treeController")
public class TreeController {


	@Autowired
	private ITreeService treeService;
	@RequestMapping("/queryTree")
	public  String queryTree(){
		return "/WEB-INF/wyc/treeList";
	}


	@RequestMapping("/selectTreeList")
	@ResponseBody
	public List<Tree> selectTreeList(){
		List<Tree> treelist=null;
		try {
			Tree tree=new Tree();
			treelist=treeService.selectTreeList(tree);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return treelist;
	}

	@RequestMapping("/tuTree")
	public String tuTree(Integer id,HttpServletRequest request){
		Tree tree=null;
		try {
			tree = treeService.tuTree(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("tree", tree);
		return "/WEB-INF/wyc/addTree";
	}

	@RequestMapping("/addTree")
	@ResponseBody
	public String addTree(Tree tree){
		try {
			treeService.addTree(tree);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}

	@RequestMapping("/deleteTree")
	@ResponseBody
	public String deleteTree(Integer id){
		try {
			treeService.deleteTree(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}


	@RequestMapping("/UpdateTree")
	@ResponseBody
	public String UpdateTree(Tree tree){
		try {
			treeService.UpdateTree(tree);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}


	@RequestMapping("getTree")
	@ResponseBody
	public List<Map<String,Object>> getTree(){
		List list = treeService.getTree();
		return treeStr(list, 0);
	}
	public List<Map<String,Object>> treeStr(List<Tree> list, Integer pid){

		//定义返回变量
		List<Map<String,Object>> newlist = new ArrayList<Map<String,Object>>();
		//循环所有数据
		for (int i = 0; i < list.size(); i++) {
			//定义以个map集合  用来存放 单个节点数据
			Map<String,Object> map = null;
			//获取单个对象数据
			Tree m = list.get(i);
			//判断当前节点是否存在父节点
			if(m.getPid().equals(pid)){
				map = new HashMap<String, Object>();
				map.put("id", m.getId());
				map.put("text", m.getText());
				map.put("url", m.getUrl());
//				map.put("icon", m.getIcon());
				map.put("children",treeStr(list,m.getId()));
			}
			if(map!=null){
				//获取子节点数据
				List<Map<String,Object>>  l = (List<Map<String,Object>>)map.get("children");
				//如果没有子节点数据 移除 nodes
				if(l.size() == 0){
					map.remove("children");
				}
				newlist.add(map);
			}
		}

		return newlist;
	}


}
