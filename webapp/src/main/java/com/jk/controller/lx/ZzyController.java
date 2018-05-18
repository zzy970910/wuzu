package com.jk.controller.lx;

import com.alibaba.fastjson.JSON;
import com.jk.bean.ht.Label;
import com.jk.bean.lx.*;
import com.jk.bean.mn.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jk.service.ZzyService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("zzyController")
public class ZzyController {
    @Autowired
    private ZzyService zzyService;

    @RequestMapping("/queryDing")
    @ResponseBody
    public Map<String, Object> queryDing(Integer page, Integer rows, Indent indent) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", zzyService.getDingWhere(indent).size());
        map.put("rows", zzyService.getDingPage(page, rows, indent));

        return map;
    }

    @RequestMapping("/updateById")
    @ResponseBody
    public Map<String, Object> updateById(Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            zzyService.updateById(id);
            map.put("succsess", true);
        } catch (Exception e) {
            map.put("succsess", false);
        }
        return map;

    }

    @RequestMapping("/queryDalei")
    @ResponseBody
    public List<Da> queryDalei() {
        return zzyService.queryDalei();
    }

    @RequestMapping("/queryXiao")
    @ResponseBody
    public List queryXiao() {
        return zzyService.queryXiao();
    }

    @RequestMapping("/queryShang")
    @ResponseBody
    public Map<String, Object> queryShang(Integer page, Integer rows, Goods good) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("total", zzyService.getGoodWhere(good).size());
        map.put("rows", zzyService.getGoodPage(page, rows, good));

        return map;
    }

    @RequestMapping("/selectda")
    @ResponseBody
    public String selectda() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("dalist", zzyService.selectda());
        map.put("tulist", zzyService.selectquanbu());
        return JSON.toJSONString(map);
    }

    @RequestMapping("/selectxiao")
    @ResponseBody
    public List<Xiao> selectxiao() {

        return zzyService.selectxiao();
    }

    @RequestMapping("queryMain")
    public String queryMain() {
        return "main";
    }

    /*    @RequestMapping("/selectquanbu")
        @ResponseBody
        public  List<Goods> selectquanbu(){
            return zzyService.selectquanbu();
        }*/
    @RequestMapping("queryXin")
    @ResponseBody
    public List<News> queryXin() {
        return zzyService.queryXin();

    }

    @RequestMapping("xiangqing")
    public ModelAndView xiangqing(Integer id) {
        ModelAndView mav = new ModelAndView();
        News news = zzyService.xiangqing(id);
        mav.addObject("news", news);
        mav.setViewName("/WEB-INF/zzy/xiang");
        return mav;
    }

    @RequestMapping("/toAddShop")
    public String toAddShop() {

        return "/WEB-INF/zzy/addshop";
    }

    @RequestMapping("/querytejia")
    @ResponseBody
    public List<Goods> querytejia() {
        return zzyService.querytejia();
    }

    @RequestMapping("/selectFenid")
    @ResponseBody
    public List<Goods> selectFenid(Integer id) {
        return zzyService.selectFenid(id);
    }

    @RequestMapping("/querybianqian")
    @ResponseBody
    public List<Label> querybianqian() {
        return zzyService.querybianqian();
    }

    @RequestMapping("/selectreping")
    @ResponseBody
    public List<Goods> selectreping() {
        return zzyService.selectreping();
    }

    @RequestMapping("updateremai")
    @ResponseBody
    public void updateremai(Integer reid) {

        zzyService.updateremai(reid);
    }

    @RequestMapping("updatetejia")
    @ResponseBody
    public void updatetejia(Integer id) {

        zzyService.updatetejia(id);
    }

    @RequestMapping("/selectmiaosha")
    public ModelAndView selectmiaosha(Integer miaosha) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("miaoid", miaosha);
        mav.setViewName("/WEB-INF/zzy/miao");
        return mav;

    }
  @RequestMapping("/selectxiang")
    public ModelAndView selectxiang(Integer id){
        ModelAndView mav = new ModelAndView();
     Goods goods =   zzyService.selectxiang(id);
     mav.addObject("goods" ,goods);
     mav.setViewName("/WEB-INF/zzy/xiangqing");
           return  mav;


  }
  @RequestMapping("/addShop")
    @ResponseBody
    public void addShop(Goods goods){
      zzyService.addShop(goods);
  }


}