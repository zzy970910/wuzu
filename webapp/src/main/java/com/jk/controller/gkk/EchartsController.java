package com.jk.controller.gkk;

import com.alibaba.fastjson.JSON;
import com.jk.bean.lx.Indent;
import com.jk.bean.lx.Goods;
import com.jk.service.EhartsService;
import com.jk.util.AliyunZzy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("echartsController")
public class EchartsController {
    @Autowired
    private EhartsService ehartsService;

    /**
     * 加载Echarts
     * @return
     */
    @RequestMapping("quertEcharts")
    @ResponseBody
    public String quertEcharts(){
        List<Indent> list = ehartsService.quertEcharts();
        return JSON.toJSONString(list);
    }

    /**
     * 加载大类下拉框
     * @return
     */
    @RequestMapping("daOption")
    @ResponseBody
    public String daOption(){
        return JSON.toJSONString(ehartsService.daOption());
    }
    /**
     * 加载小类下拉框
     * @param id
     * @return
     */
    @RequestMapping("xiaoOption")
    @ResponseBody
    public String xiaoOption(Integer id){
        return JSON.toJSONString(ehartsService.xiaoOption(id));
    }
    /**
     * 商品新增
     */
    @RequestMapping("addShop")
    @ResponseBody
    public String addShop(Goods goods,@RequestParam(value="file",required=false)CommonsMultipartFile file) throws IOException {
        String url = AliyunZzy.FileImg(file);
        goods.setImage(url);
        String str = ehartsService.addShop(goods);
        return str;
    }


    /**
     * 批量删除
     */
    @RequestMapping("deleteShop")
    @ResponseBody
    public String deleteShop(String strid){
        String str = ehartsService.deleteShop(strid);
        return str;
    }
}
