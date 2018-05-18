package com.jk.controller.mn;

import com.alibaba.fastjson.JSON;
import com.jk.bean.lx.Da;
import com.jk.bean.lx.Xiao;
import com.jk.service.ShopLeiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("shoplei")
public class ShopLeiController {
    @Autowired
    private ShopLeiService shopLeiService;
    //新增商品大类
    @RequestMapping("addDaLei")
    @ResponseBody
    public void addDaLei(Da da){
        shopLeiService.addDaLei(da);
    }
    //删除商品大类
    @RequestMapping("deleteDaLei")
    @ResponseBody
    public String deleteDaLei(Integer id){
        shopLeiService.deleteDaLei(id);
        return "success";
    }
    //查询新闻根据ID
    @RequestMapping("queryDaById")
    public String queryDaById(Integer id,Model model){
        Da da = shopLeiService.queryDaById(id);
        model.addAttribute("da", da);
        return "WEB-INF/news/addShopDaLei";
    }
    //修改
    @RequestMapping("updateDa")
    @ResponseBody
    public String updateDa(Da da){
        shopLeiService.updateDa(da);
        return "success";
    }

    //查询商品大类
    @RequestMapping("queryda")
    @ResponseBody
    public String queryda(){
        List<Da> list=shopLeiService.queryda();
        return JSON.toJSONString(list);
    }
    //新增商品小类
    @RequestMapping("addXiaoLei")
    @ResponseBody
    public void addXiaoLei(Xiao xiao){

        shopLeiService.addXiaoLei(xiao);
    }
    //删除商品小类
    @RequestMapping("deleteXiaoLei")
    @ResponseBody
    public String deleteXiaoLei(Integer id){
        shopLeiService.deleteXiaoLei(id);
        return "success";
    }
    //查询新闻根据ID
    @RequestMapping("queryXiaoById")
    public String queryXiaoById(Integer id,Model model){
        Xiao xiao = shopLeiService.queryXiaoById(id);
        model.addAttribute("xiao", xiao);
        return "WEB-INF/news/addShopXiaoLei";
    }
    //修改
    @RequestMapping("updateXiao")
    @ResponseBody
    public String updateXiao(Xiao xiao){
        shopLeiService.updateXiao(xiao);
        return "success";
    }
}
