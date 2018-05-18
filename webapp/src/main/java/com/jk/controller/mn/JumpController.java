package com.jk.controller.mn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("jump")
public class JumpController {
    //跳转新闻查询页面
    @RequestMapping("jumpShowNews")
    public String jumpShowNews(){

        return "WEB-INF/news/show";
    }
    //跳转新闻新增页面
    @RequestMapping("jumpAddNews")
    public String jumpADDNews(){

        return "WEB-INF/news/add";
    }
    //跳转留言查询页面
    @RequestMapping("jumpShowLiuYan")
    public String jumpShowLiuYan(){
        return "WEB-INF/news/showLy";
    }
    //跳转poi页面
    @RequestMapping("jumpShowPoi")
    public String jumpShowPoi(){
        return "WEB-INF/news/poishow";
    }
    //跳转商品大类新增页面
    @RequestMapping("jumpAddShopDaLei")
    public String jumpAddShop(){
        return "WEB-INF/news/addShopDaLei";
    }
    //跳转商品小类新增页面
    @RequestMapping("jumpAddShopXiaoLei")
    public String jumpAddShopXiao(){
        return "WEB-INF/news/addShopXiaoLei";
    }
    //跳转商品新增页面
    @RequestMapping("toAddShop")
    public String toAddShop(){
        return "WEB-INF/news/addShop";
    }
    //跳poi
    @RequestMapping("topoidaoc")
    public String topoidaoc(){

        return "/WEB-INF/news/poidaoc";
    }
}
