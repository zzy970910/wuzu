package com.jk.controller.ht;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.ht.Label;
import com.jk.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("labelController")
public class LabelController {

       @Autowired
       private LabelService labelService;

       //查询
       @RequestMapping("/selectlabel")
       @ResponseBody
       public JSONObject selectlabel(String labelname, int rows, int page, Label label){
              JSONObject Label= null;
              try {
                     Label=labelService.selectlabel(label,page,rows,labelname);
              } catch (Exception e) {
                     e.printStackTrace();
              }
              return Label;
       }



       //新增
       @RequestMapping("/toAddlabel")
       public String toAddlabel(HttpServletRequest request){
		/*List list=null;
		try {
			list = deptStaffService.getDeptName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("list", list);*/

              return "addlabel";
       }


       @RequestMapping("/addLabel")
       @ResponseBody
       public void addLabel(Label label){

              labelService.addLabel(label);


       }

       //删除
       @RequestMapping("/deleteLabel")
       @ResponseBody
       public String deleteLabel(Integer labelid){
              try {
                     labelService.deleteLabel(labelid);
              } catch (Exception e) {
                     // TODO Auto-generated catch block
                     e.printStackTrace();
              }

              return "success";
       }

       //修改
       @RequestMapping("/updateLabel")
       @ResponseBody
       public String updateLabel(Label label){
              try {
                     labelService.updateLabel(label);
              } catch (Exception e) {
                     // TODO Auto-generated catch block
                     e.printStackTrace();
              }

              return "success";
       }


}
