package com.jk.controller.ht;

import com.jk.bean.ht.Tree;
import com.jk.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/UserController")
public class UserController {

    @Resource
    private IUserService userService;


    @RequestMapping("getTree")
    @ResponseBody
    public List<Map<String,Object>> getTree(){
        List list = userService.getTree();
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
                map.put("icon", m.getIcon());
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
