package com.jk.controller.ht;

import com.alibaba.fastjson.JSONObject;
import com.jk.bean.ht.Batch;
import com.jk.bean.ht.Label;
import com.jk.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("batchController")
public class BatchController {

        @Autowired
        private BatchService batchService;


        //查询
        @RequestMapping("/selectbatch")
        @ResponseBody
        public JSONObject selectbatch(String bname, int rows, int page, Batch batch){
                JSONObject Label= null;
                try {
                        Label=batchService.selectbatch(batch,page,rows,bname);
                } catch (Exception e) {
                        e.printStackTrace();
                }
                return Label;
        }


        //新增
        @RequestMapping("/toAddbatch")
        public String toAddbatch(HttpServletRequest request){
		/*List list=null;
		try {
			list = deptStaffService.getDeptName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("list", list);*/

                return "addbatch";
        }


        @RequestMapping("/addBatchList")
        @ResponseBody
        public void addBatchList(Batch batch){

                batchService.addBatchList(batch);


        }

        //删除
        @RequestMapping("/deleteBatch")
        @ResponseBody
        public String deleteBatch(Integer id){
                try {
                        batchService.deleteBatch(id);
                } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }

                return "success";
        }

        //修改
        @RequestMapping("/updateBatch")
        @ResponseBody
        public String updateBatch(Batch batch){
                try {
                        batchService.updateBatch(batch);
                } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }

                return "success";
        }

}
