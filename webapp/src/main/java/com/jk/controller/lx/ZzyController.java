package com.jk.controller.lx;

import com.alibaba.fastjson.JSON;
import com.jk.bean.ht.Label;
import com.jk.bean.lx.*;
import com.jk.bean.mn.News;
import com.jk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jk.service.ZzyService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

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
    public ModelAndView selectxiang(Integer id,HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
       User user =(User)request.getSession().getAttribute("user");
     Goods goods =   zzyService.selectxiang(id);
     mav.addObject("goods" ,goods);
      mav.addObject("user" ,user);
     mav.setViewName("/WEB-INF/zzy/xiangqing");
           return  mav;


  }
  @RequestMapping("queryMiao")
    @ResponseBody
    public List<Miao> queryMiao(){
        return zzyService.queryMiao();
  }
  @RequestMapping("/addGoods")
    @ResponseBody
    public void addGoods(Miao miao){
      zzyService.addGoods(miao);
  }

   //查询秒杀

  @RequestMapping("/selectMiao")
    @ResponseBody
    public Map<String,Object> selectMiao(){
      Map<String,Object> map = new HashMap<String, Object>();
      List<Miao> list= zzyService.selectMiao();
      String mag="";
      Integer flag=0;
      if(list!=null&&list.get(0)!=null) {
          long nowtime = new Date().getTime();
          long time = list.get(0).getBegintime().getTime();
          long endtime = list.get(0).getEndtime().getTime();
          long shengtimexioashi = (endtime - nowtime) / 1000 / 60 / 60;
          long endfentime = (endtime - nowtime) / 1000 / 60 - shengtimexioashi * 60;
          long endmiaotime = (endtime - nowtime) / 1000 - shengtimexioashi * 60 - endfentime * 60;
          long daojishi = 0l;
          long daojishi2 = 0l;
          long l = time - nowtime;
          long l1 = (time - nowtime) / 1000;
          long l2 = (endtime - nowtime) / 1000;
          Integer cout = list.get(0).getCount();
          if (l > 0) {
              long m = l / 1000 / 60 / 60;
              if (m > 1) {
                  long m1 = l / 1000 / 60 - m * 60;
                  long m2 = l / 1000 - m1 * 60 - m * 60 * 60;
                  mag = "距离秒杀还有" + m + "小时" + m1 + "分钟" + m2 + "秒";
                  daojishi = l1;
                  flag = 1;//还未开始
              } else {
                  long m1 = l / 1000 / 60;
                  long m2 = l / 1000 - m1 * 60 - m * 60 * 60;
                  mag = "距离秒杀还有0小时" + m1 + "分钟" + m2 + "秒";
                  daojishi = l1;
                  flag = 1;//还未开始
              }
          } else {
              long time2 = list.get(0).getEndtime().getTime();
              if ((time2 - nowtime) < 0) {
                  mag = "秒杀已结束";
                  daojishi = l1;
                  cout = 0;
                  flag = 3;
              } else {
                  mag = "秒杀进行中..剩余时间" + shengtimexioashi + "小时" + endfentime + "分" + endmiaotime + "秒";
                  daojishi = l1;
                  daojishi2 = l2;
                  flag = 2;//已经开始


              }
          }

          map.put("mag", mag);
          map.put("flag", flag);
          map.put("count", cout);
          map.put("miaoshu", daojishi);
          map.put("miaoshu2", daojishi2);

      }
      return map;
  }
@RequestMapping("toIndex")
    public String toIndex(){
        return "/WEB-INF/zzy/index";
}
    @RequestMapping("/miaoshaGoods")
   @ResponseBody
   public String miaoshaGoods( HttpServletRequest request,Miao miao ,HttpServletResponse response,Integer id) {
        Object object = request.getSession().getAttribute("user");

        if (object != null) {
            zzyService.updateKucun(id);
            return "1";

        } else{


            return "2";
        }



    }
    //生成订单
    @RequestMapping("/addljgm")
    @ResponseBody
    public void addljgm(Indent indent,Integer gid,Integer uid){
        Goods goods = zzyService.querygoodsbyid(gid);

        indent.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString());
        indent.setStatus(2);


        indent.setIndentcode(UUID.randomUUID().toString().replaceAll("-",""));

        goods.setCount(1);
        zzyService.addljgm(indent,goods,uid);

}
     @RequestMapping("/addGou")
    @ResponseBody
    public void addGou(Integer gid ,Integer uid,Gou gou){
         Goods good = zzyService.querygoodsbyid(gid);
           gou.setCarid(UUID.randomUUID().toString().replaceAll("-",""));
           good.setCount(1);
           gou.setStatus(2);
           gou.setGoodsxiaoji(good.getCount()*good.getPrice());
         zzyService.addGou(uid,good,gou);


     }
     @RequestMapping("/selectGwc")
    public String selectGwc(Integer id, Model model){
        model.addAttribute("id",id);
         System.out.println(id);
        return "/WEB-INF/zzy/gwc";
     }
     @RequestMapping("/selectGG")
    @ResponseBody
    public  List selectGG(Integer id){
         System.out.println(id);
        return zzyService.selectGG(id);
     }
     @RequestMapping("/updateGwc")
    @ResponseBody
    public void deletGwc(Integer id){
         zzyService.updateGwc(id);
     }
}