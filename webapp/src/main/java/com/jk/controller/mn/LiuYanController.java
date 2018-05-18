package com.jk.controller.mn;

import com.jk.service.LiuYanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import java.util.Map;

@Controller
@RequestMapping("LiuYan")
public class LiuYanController {
    @Autowired
    private LiuYanService liuYanService;

    //查询新闻(分页)
    @RequestMapping("selectsLiuYan")
    @ResponseBody
    public String selectsLiuYan(Integer page,Integer rows){
        Map map = liuYanService.selectsLiuYan(page,rows);
        return JSON.toJSONString(map);
    }

    //删除
    @RequestMapping("deleteLiuYan")
    @ResponseBody
    public String deleteLiuYan(Integer id){
        liuYanService.deleteLiuYan(id);
        return "success";
    }
}
